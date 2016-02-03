//
//  ViewController.swift
//  Map_demo
//
//  Created by Wan Kim Mok on 2/1/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set longitude and latitude for initial view when app starts
        var latitude : CLLocationDegrees = 40.7
        var longitude : CLLocationDegrees = -73.9
        
        //set the delta for latitude and longitude (handles how much you want to zoom in, smaller the delta the more zoom in it is)
        var latDelta : CLLocationDegrees = 0.01
        var lonDelta : CLLocationDegrees = 0.01
        
        //set span cooredinates using the deltas we assigned earlier
        var span : MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        //set the location using the latitude and longitude information
        var location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        //set region using the location and span
        var region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        //set the region in the map
        map.setRegion(region, animated: true)
        
        //create annotation
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Brooklyn"
        annotation.subtitle = "Hello .... Brooklyn"
        
        //add the annotation to the map
        map.addAnnotation(annotation)
        
        //variable for longpress and setups and where actions: is the function to be run when longpress is recognized
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        //set the minimum duration have to press down to have the long press recognized
        uilpgr.minimumPressDuration = 2
        
        //add this to the map
        map.addGestureRecognizer(uilpgr)
        
        
        
    }
    
    //action function that receives a variable type uigestureRecognizer
    func action(gestureRecognizer: UIGestureRecognizer){
        print("Gesture recognized!")
        
        //touchPoint gives the point where the long pressed on relative to the map in the view
        var touchPoint = gestureRecognizer.locationInView(self.map)
        
        var newCoordinate : CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        //create annotation
        var annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinate
        annotation.title = "New Place"
        annotation.subtitle = "Hello .... Brooklyn"
        
        //add the annotation to the map
        map.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

