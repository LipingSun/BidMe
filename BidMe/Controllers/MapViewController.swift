//
//  MapViewController.swift
//  BidMe
//
//  Created by Dexter Wei on 11/30/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import UIKit
import MapKit
import AVOSCloud

class MapViewController: UIViewController,MKMapViewDelegate {
    
    @IBOutlet weak var BidMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        setupLeftMenuButton()
        
        BidMapView.delegate = self
        
        let initialLocation = CLLocation(latitude: 37.3883809, longitude:-121.8834904)
        centerMapOnLocation(initialLocation)
        
        let sample_auction = Auction()
        
        let item = Item()
        item.name = "Xbox"
        item.desc = "270$"
        sample_auction.item = item
        sample_auction.location = AVGeoPoint(latitude: 37.386491, longitude: -121.8842214)
        
        let sample_event = AuctionEvent(auction: sample_auction)
        sample_event.assignImage(UIImage(named: "moto")!)
        
        BidMapView.addAnnotation(sample_event)
    }
    
    let regionRadius: CLLocationDistance = 300
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        BidMapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if let annotation = annotation as? AuctionEvent {
            let identifier = "pin"
            var view: MKAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView { // 2
                    dequeuedView.annotation = annotation
                    view = dequeuedView
            } else {
                // 3
                view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                //view.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure)
            }
            print("here B")
            if let img = annotation.image {
                view.image=img
            }
            return view
        }
        return nil
    }
    
    func setupLeftMenuButton() {
        let leftDrawerButton = MMDrawerBarButtonItem(target: self, action: "leftSideMenuTapped:")
        self.navigationItem.setLeftBarButtonItem(leftDrawerButton, animated: false)
    }
    
    func leftSideMenuTapped(sender: AnyObject) {
        self.mm_drawerController.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }
}