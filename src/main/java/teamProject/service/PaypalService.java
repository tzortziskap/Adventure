/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.service;

import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import org.springframework.stereotype.Service;

@Service
public interface PaypalService {
    public Payment createPayment(
            Double total,
            String description,
            String cancelUrl,
            String successUrl) throws PayPalRESTException;

    public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException;
}
