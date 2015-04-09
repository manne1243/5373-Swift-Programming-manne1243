//
//  SecondViewController.swift
//  MyLocations
//
//  Created by Terry Griffin on 3/24/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* 1
        let location = CLLocationCoordinate2D(
            latitude: 51.50007773,
            longitude: -0.1246402
        )
        // 2
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        //3
        let annotation = MKPointAnnotation()
        annotation.setCoordinate(location)
        annotation.title = "Big Ben"
        annotation.subtitle = "London"
        mapView.addAnnotation(annotation)*/
    }
    override func viewWillAppear(animated: Bool) {
        // Get a reference to the model data from the custom tab bar controller.
        let location = (self.tabBarController as CustomTabBarController).points
        
        let locations = CLLocationCoordinate2D(
            latitude:location.lat,
            longitude: location.long
        )
        
        // 2
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: locations, span: span)
        mapView.setRegion(region, animated: true)
        
        //3
        let annotation = MKPointAnnotation()
        annotation.setCoordinate(locations)
        annotation.title = ""
        annotation.subtitle = ""
        mapView.addAnnotation(annotation)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
