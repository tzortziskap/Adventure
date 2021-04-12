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
import teamProject.entity.Credentials;
import teamProject.entity.CustomerBooksEvent;
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

    @GetMapping("/{eventID}")
    public String checkout(@PathVariable("eventID") int id, CustomerBooksEvent book, Model model, HttpServletRequest request) {
        Credentials user = (Credentials)request.getSession().getAttribute("loggedInUser");
        book.setCustomerId(user.getCustomer());
        book.setEventId(eventService.getEventById(id));
        book.setTotalPrice(customerBooksEventService.getTotalPrice(book));
        request.getSession().setAttribute("book", book);
        return "checkout";
    }

    @PostMapping("/pay")
    public String payment(HttpServletRequest request) {    // parses the approved Payment object returned from PayPal to find the approval URL
        try {
            CustomerBooksEvent book = (CustomerBooksEvent)request.getSession().getAttribute("book");
            Payment payment = service.createPayment(book.getTotalPrice(), book.getEventId().getName(), "http://localhost:8080/Adventure/payment/pay/cancel",
                    "http://localhost:8080/Adventure/payment/pay/success");
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

    @GetMapping("/pay/cancel")
    public String cancelPay(HttpServletRequest request) {
        request.getSession().removeAttribute("book");
        return "cancel";
    }

    @GetMapping("/pay/success")  //captures Payers info and booking details and displays success jsp
    public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId, Model model, HttpServletRequest request) {   //, 
        try {
            CustomerBooksEvent book = (CustomerBooksEvent) request.getSession().getAttribute("book");
            System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"+ book.getAmountPositions());
            Payment payment = service.executePayment(paymentId, payerId);
            System.out.println(payment.toJSON());
            if (payment.getState().equals("approved")) {
                Transaction transaction = payment.getTransactions().get(0);
                PayerInfo payer = payment.getPayer().getPayerInfo();
                model.addAttribute("payer", payer);
                model.addAttribute("transaction", transaction);
                model.addAttribute("book", book);
                customerBooksEventService.addCustomerBooksEvent(book);
                request.getSession().removeAttribute("book");
                return "success";
            }
        } catch (PayPalRESTException e) {
            System.out.println(e.getMessage());
        }
        return "redirect:/";
    }
}
