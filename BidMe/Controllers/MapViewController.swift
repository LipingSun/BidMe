//
//  MapViewController.swift
//  BidMe
//
//  Created by Dexter Wei on 11/30/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import CoreLocation
import UIKit
import MapKit
// import AVOSCloud

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var BidMapView: MKMapView!
    var locationManager : CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        setupLeftMenuButton()

        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        BidMapView.delegate = self
        BidMapView.showsUserLocation = true

        let initialLocation = CLLocation(latitude: 37.334959, longitude:-121.880591)
        centerMapOnLocation(initialLocation)

        let auctionQuery = Auction.query()
        auctionQuery.includeKey("item.picture")
        auctionQuery.findObjectsInBackgroundWithBlock({(objects: [AnyObject]?, error: NSError?) in
            if (error == nil) {
                for auction in objects as! [Auction] {
                    auction.item?.picture?.getThumbnail(true, width: 100, height: 100, withBlock: {(image: UIImage?, error: NSError?) in
                        let auctionEvent = AuctionEvent(auction: auction)
                        auctionEvent.image = image
                        self.BidMapView.addAnnotation(auctionEvent)
                    })
                }
            }
        })


//        let sample_auction = Auction()
//        
//        let item = Item()
//        item.name = "Xbox"
//        item.desc = "270$"
//        sample_auction.item = item
//        sample_auction.location = AVGeoPoint(latitude: 37.386491, longitude: -121.8842214)
//        
//        let sample_event = AuctionEvent(auction: sample_auction)
//        sample_event.assignImage(UIImage(named: "moto")!)
//        
//        BidMapView.addAnnotation(sample_event)
    }

    let regionRadius: CLLocationDistance = 1000

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                regionRadius * 2.0, regionRadius * 2.0)
        BidMapView.setRegion(coordinateRegion, animated: true)
    }
    //Dexter: func updated
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? AuctionEvent {
            let identifier = "pin"
            var view: AuctionEventAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                    as? AuctionEventAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
                view.assignEvent(annotation.act)
                print("assigning item to AuctionEventAnnotationView")
                print(view.auction?.item?.name)
            } else {
                // 3
                view = AuctionEventAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: UIButtonType.DetailDisclosure)
                view.assignEvent(annotation.act)
                print("assigning item to AuctionEventAnnotationView")
                print(view.auction?.item?.name)
            }
            print("here B")
            if let img = annotation.image {
                view.image=img
            }else{
                return nil
            }
            return view
        }
        return nil
    }
    //Dexter:   func updated
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl) {
        let centerStoryboard: UIStoryboard = UIStoryboard(name: "Center", bundle: nil)
        if let ano = view as? AuctionEventAnnotationView{

            let detailViewController = centerStoryboard.instantiateViewControllerWithIdentifier("AuctionDetailViewController") as! AuctionDetailViewController
            detailViewController.auction = ano.auction

            self.showViewController(detailViewController, sender: self)
        }
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if (!locations.isEmpty) {
            let myLocation  = locations[0]
            BidMapView.setRegion(MKCoordinateRegionMake(CLLocationCoordinate2DMake(myLocation.coordinate.latitude, myLocation.coordinate.longitude), BidMapView.region.span), animated: true)
        }
    }

    func setupLeftMenuButton() {
        let leftDrawerButton = MMDrawerBarButtonItem(target: self, action: "leftSideMenuTapped:")
        self.navigationItem.setLeftBarButtonItem(leftDrawerButton, animated: false)
    }

    func leftSideMenuTapped(sender: AnyObject) {
        self.mm_drawerController.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }
}