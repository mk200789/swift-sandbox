//
//  ViewController.swift
//  Where_am_I
//
//  Created by Wan Kim Mok on 2/2/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate  {
    
    @IBOutlet var altitude: UILabel!
    
    @IBOutlet var latitude: UILabel!
    
    @IBOutlet var longitude: UILabel!
    
    @IBOutlet var speed: UILabel!
    
    @IBOutlet var address: UILabel!
    
    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        //setup locationManager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        //set up the initial view of the map when app starts
        var latitude : CLLocationDegrees = 40.5734344
        var longitude : CLLocationDegrees = -73.978573
        
        var latDelta : CLLocationDegrees = 0.01
        var lonDelta : CLLocationDegrees = 0.01
        
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
    }
    
    /*
    to do:
        show user latitude longitude, speed, altitude, course
        get nearest address of the location (reversegeocode location)
    */
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]){
        
        //get user's location
        var userLocation : CLLocation = locations[0] as CLLocation
        
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        
        var latDelta: CLLocationDegrees = 0.05
        var lonDelta: CLLocationDegrees = 0.05
        
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        
        //set labels
        self.altitude.text = "\(userLocation.altitude)"
        
        self.speed.text = "\(userLocation.speed)"
        
        self.latitude.text = "\(latitude)"
        
        self.longitude.text = "\(longitude)"
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler:{ (placemarks, error) -> Void in
            
            if (error != nil){
                //print(error)
            }
            else{
                if let p = CLPlacemark(placemark: placemarks[0] as CLPlacemark){
                    print(p)
                    var address = "\(p.thoroughfare) \(p.locality) \(p.subAdministrativeArea) \(p.postalCode) \(p.country)"
                    
                    self.address.text = address
                }
            }
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

