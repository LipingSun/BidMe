//
//  PaypalViewController.swift
//  BidMe
//
//  Created by Liping on 12/2/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import UIKit

class PaypalViewController: UIViewController, PayPalFuturePaymentDelegate {

    var payPalConfig = PayPalConfiguration()
    
    var environment:String = PayPalEnvironmentNoNetwork{
        willSet(newEnvironment){
            if(newEnvironment != environment){
                PayPalMobile.preconnectWithEnvironment(newEnvironment)
            }
        }
    }

    #if HAS_CARDIO
    var acceptCreditCards: Bool = true {
    didSet {
    payPalConfig.acceptCreditCards = acceptCreditCards
    }
    }
    #else
    var acceptCreditCards: Bool = false {
        didSet {
            payPalConfig.acceptCreditCards = acceptCreditCards
        }
    }
    #endif
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        payPalConfig.acceptCreditCards = acceptCreditCards
        payPalConfig.merchantName = "BidMe Inc."
        payPalConfig.merchantPrivacyPolicyURL = NSURL(string: "https://www.paypal.com/webapps/mpp/ua/privacy-full")
        payPalConfig.merchantUserAgreementURL = NSURL(string: "https://www.paypal.com/webapps/mpp/ua/useragreement-full")
        payPalConfig.languageOrLocale = NSLocale.preferredLanguages()[0]
        payPalConfig.payPalShippingAddressOption = .PayPal;
        PayPalMobile.preconnectWithEnvironment(environment)
        
        // Do any additional setup after loading the view, typically from a nib.
        let futurePaymentViewController = PayPalFuturePaymentViewController(configuration: payPalConfig, delegate: self)
        presentViewController(futurePaymentViewController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func authorizeFuturePaymentsAction(sender: AnyObject) {
        let futurePaymentViewController = PayPalFuturePaymentViewController(configuration: payPalConfig, delegate: self)
        presentViewController(futurePaymentViewController, animated: true, completion: nil)
    }


    func payPalFuturePaymentDidCancel(futurePaymentViewController: PayPalFuturePaymentViewController!) {
        print("PayPal Future Payment Authorization Canceled")
        futurePaymentViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

    func payPalFuturePaymentViewController(futurePaymentViewController: PayPalFuturePaymentViewController!, didAuthorizeFuturePayment futurePaymentAuthorization: [NSObject : AnyObject]!) {
        print("PayPal Future Payment Authorization Success!")
        // send authorization to your server to get refresh token.
        futurePaymentViewController?.dismissViewControllerAnimated(true, completion: { () -> Void in
            self.performSegueWithIdentifier("BackToBidding", sender: self)
        })
    }

}
