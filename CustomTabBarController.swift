//
//  CustomTabBarController.swift
//  MyLocations
//
//  Created by Sampath kumar Manne on 3/31/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import Foundation
import UIKit

// This class holds the data for my location (latitude and Longitude).
class LocationData {
    //Declaring variables and Initializing to 0.
    var lat = 0.0
    var long = 0.0
}

class CustomTabBarController: UITabBarController {
    
    // Instantiate the one copy of the location data that will be accessed
    // by every other tab in need.
    var points = LocationData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}