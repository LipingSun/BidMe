//
//  PaypalViewController.swift
//  BidMe
//
//  Created by Liping on 12/2/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import UIKit

class PaypalViewController: UIViewController, PayPalPaymentDelegate {

    var payPalConfig = PayPalConfiguration()
    
    var environment:String = PayPalEnvironmentNoNetwork{
        
        willSet(newEnvironment){
            if(newEnvironment != environment){
                PayPalMobile.preconnectWithEnvironment(newEnvironment)
            }
        }
        
    }
    
    
    var acceptCredictCards: Bool = true{
        didSet{
            payPalConfig.acceptCreditCards = acceptCredictCards
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        payPalConfig.acceptCreditCards = acceptCredictCards;
        payPalConfig.merchantName = "BidMe Inc."
        payPalConfig.merchantPrivacyPolicyURL = NSURL(string: "https://www.sivaganesh.com/privacy.html")
        payPalConfig.merchantUserAgreementURL = NSURL(string: "https://www.sivaganesh.com/useragreement.html")
        payPalConfig.languageOrLocale = NSLocale.preferredLanguages()[0]
        payPalConfig.payPalShippingAddressOption = .PayPal;
        PayPalMobile.preconnectWithEnvironment(environment)
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func payPalPaymentDidCancel(paymentViewController: PayPalPaymentViewController!) {
        print("PayPal Payment Cancelled")
        paymentViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func payPalPaymentViewController(paymentViewController: PayPalPaymentViewController!, didCompletePayment completedPayment: PayPalPayment!) {
        print("PayPal Payment Success!")
        paymentViewController?.dismissViewControllerAnimated(true, completion: { () -> Void in
            print("Here is your proof of payment:\n\n\(completedPayment.confirmation)\n\nSend this to your server for confirmation and fullfillment.")
        })
    }
    
    @IBAction func btnPressed(sender: AnyObject) {
        var item1 = PayPalItem(name: "BidMe Inc .", withQuantity: 1,withPrice: NSDecimalNumber(string: "9.00"),withCurrency: "USD", withSku: "0001")
        let items = [item1]
        let subtotal = PayPalItem.totalPriceForItems(items)
        
        let shipping = NSDecimalNumber(string: "0.00")
        let tax = NSDecimalNumber(string: "0.00")
        let paymentDetails = PayPalPaymentDetails(subtotal: subtotal, withShipping: shipping, withTax: tax)
        
        let total = subtotal.decimalNumberByAdding(shipping).decimalNumberByAdding(tax)
        let payment = PayPalPayment(amount: total, currencyCode: "USD", shortDescription: "BidMe Inc. Test", intent: .Sale)
        
        
        payment.items=items
        payment.paymentDetails = paymentDetails
        
        if(payment.processable){
            
            let paymentViewController = PayPalPaymentViewController(payment: payment, configuration: payPalConfig, delegate: self)
            presentViewController(paymentViewController, animated: true, completion: nil)
        }
        else{
            print("Payment not processable")
        }
        
        
    }

}
