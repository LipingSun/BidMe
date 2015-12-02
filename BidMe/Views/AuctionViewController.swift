//
//  ViewController.swift
//  GetImage
//
//  Created by Zheng on 11/28/15.
//  Copyright © 2015 ZnS.dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getBtn(sender: AnyObject) {
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType=UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(image,animated: true, completion:nil)
        
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let theInfo:NSDictionary=info as NSDictionary
        let img:UIImage = theInfo.objectForKey(UIImagePickerControllerOriginalImage) as! UIImage
        imgView.image=img

        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

}

