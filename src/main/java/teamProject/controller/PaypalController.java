/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.controller;

import com.paypal.api.payments.Links;
import javax.servlet.http.HttpServletRequest;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import teamProject.dto.Order;
import teamProject.entity.Company;
import teamProject.entity.Credentials;
import teamProject.entity.CustomerBooksEvent;
import teamProject.entity.Event;
import teamProject.service.CustomerBooksEventService;
import teamProject.service.EventService;
import teamProject.service.PaypalService;

@Controller
@RequestMapping("/payment")
public class PaypalController {

    @Autowired
    PaypalService service;
    @Autowired
    EventService eventService;
    @Autowired
    CustomerBooksEventService customerBooksEventService;

    public static final String SUCCESS_URL = "pay/success";
    public static final String CANCEL_URL = "pay/cancel";
    Order οrder = new Order();

    @GetMapping("/{eventID}")
    public String checkout(@PathVariable("eventID") int id, CustomerBooksEvent book, Model model, HttpServletRequest request) {
        Credentials user = (Credentials)request.getSession().getAttribute("loggedInUser");
        book.setCustomerId(user.getCustomer());
        book.setEventId(eventService.getEventById(id));
        book.setTotalPrice(customerBooksEventService.getTotalPrice(book));
        model.addAttribute("book", book);
        return "checkout";
    }

    @PostMapping("/pay")
    public String payment() {    

        try {
            Payment payment = service.createPayment(οrder.getTotalPrice(), οrder.getEvent().getName(), "http://localhost:8080/Adventure/payment/" + CANCEL_URL,
                    "http://localhost:8080/Adventure/payment/" + SUCCESS_URL);

            for (Links link : payment.getLinks()) {
                if (link.getRel().equals("approval_url")) {
                    return "redirect:" + link.getHref();
                }
            }
        } catch (PayPalRESTException e) {

            e.printStackTrace();
        }
        return "redirect:/payment";
    }

    @GetMapping(value = CANCEL_URL)
    public String cancelPay() {
        return "cancel";
    }

    @GetMapping(value = SUCCESS_URL)
    public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId, Model model, HttpServletRequest request) {   //, 
        try {
            Payment payment = service.executePayment(paymentId, payerId);
            System.out.println(payment.toJSON());
            if (payment.getState().equals("approved")) {
                Transaction transaction = payment.getTransactions().get(0);
                Company company = οrder.getEvent().getCompanyId();
                PayerInfo payer = payment.getPayer().getPayerInfo();
                model.addAttribute("event", οrder.getEvent());
                model.addAttribute("payer", payer);
                model.addAttribute("transaction", transaction);
                model.addAttribute("company", company);
                String total = transaction.getAmount().getTotal();
                model.addAttribute("count", οrder.getCount());
                CustomerBooksEvent customerBooksEvent = customerBooksEventService.create(request,total, οrder);
                customerBooksEventService.addCustomerBooksEvent(customerBooksEvent);
                return "success";
            }
        } catch (PayPalRESTException e) {
            System.out.println(e.getMessage());
        }
        return "redirect:/";
    }
}
