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

class MapViewController: UIViewController {
    
    @IBOutlet weak var BidMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let initialLocation = CLLocation(latitude: 37.3883809, longitude:-121.8834904)
        centerMapOnLocation(initialLocation)
        
        BidMapView.delegate = self
//        let sample_event = AuctionEvent(title: "Xbox One",
//            locationName: "Pacific Rim Plaza",
//            category: "Game",
//            coordinate: CLLocationCoordinate2D(latitude: 37.386491, longitude: -121.8842214))
        
        let sample_auction = Auction()
        //sample_auction.status = "something"
        sample_auction.location = AVGeoPoint(latitude: 37.386491, longitude: -121.8842214)
        
        let sample_event = AuctionEvent(auction: sample_auction)
        
        BidMapView.addAnnotation(sample_event)
    }
    
    let regionRadius: CLLocationDistance = 300
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        BidMapView.setRegion(coordinateRegion, animated: true)
    }
    
    
}

