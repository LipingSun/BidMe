//
//  ViewController.swift
//  GetImage
//
//  Created by Zheng on 11/28/15.
//  Copyright © 2015 ZnS.dev. All rights reserved.
//

import UIKit
import AVOSCloud

class AuctionViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //MARK: properties
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var startTime: UIDatePicker!
    @IBOutlet weak var endTime: UIDatePicker!
    @IBOutlet weak var desField: UITextView!
    
    
    
    @IBAction func publishItem(sender: AnyObject) {
        
        
        //create an item
        let item = Item()
        item.name=nameField.text
        item.desc=desField.text
        
        let imageSize = imgView.image?.size
        let scale = imageSize!.width / 150
        
        item.picture = AVFile(name: String(item.name!) + ".png", data: UIImagePNGRepresentation(imageWithImage(imgView.image!, scaledToSize: CGSize(width: (imageSize?.width)! / scale, height: (imageSize?.height)! / scale))))
        
        //create an auction object
        let auctionObject = Auction()
        let price = (priceField.text! as NSString).floatValue
        auctionObject.item=item
        auctionObject.startPrice=price
        auctionObject.startTime=startTime.date
        auctionObject.endTime=endTime.date
        auctionObject.location=AVGeoPoint(latitude: 37.332224, longitude: -121.869382)

        item.picture!.saveInBackgroundWithBlock({(succeeded: Bool, error: NSError?) in
            auctionObject.saveInBackground()
        })
    }
    
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dismiss keyboard when tap outside the specific view
        let dismissKeyboard: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(dismissKeyboard)
        
        
        //add gesture recognizer on image view
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("imageTapped:"))
        imgView.userInteractionEnabled = true
        imgView.addGestureRecognizer(tapGestureRecognizer)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageTapped(img: AnyObject)
    {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType=UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(image,animated: true, completion:nil)
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let theInfo:NSDictionary=info as NSDictionary
        let img:UIImage = theInfo.objectForKey(UIImagePickerControllerOriginalImage) as! UIImage
        imgView.image=img
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}

