//
//  ViewController.swift
//  Memorable_places
//
//  Created by Wan Kim Mok on 2/5/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit
import MapKit
/*
Goal:
    Table view controller: shows all the user favorite places
    Map page: user view where those places are and allow them to choose new places with long press

*/
class ViewController: UIViewController{

    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set up the initial view of the map when app starts
        var latitude : CLLocationDegrees = 40.5734344
        var longitude : CLLocationDegrees = -73.978573
        
        var latDelta : CLLocationDegrees = 0.01
        var lonDelta : CLLocationDegrees = 0.01
        
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        //variable for longpress and setups and where actions: is the function to be run when longpress is recognized
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        //set the minimum duration have to press down to have the long press recognized
        uilpgr.minimumPressDuration = 2
        
        //add this to the map
        map.addGestureRecognizer(uilpgr)
    }
    
    func action(gestureRecognizer: UIGestureRecognizer){
        print("HELLO LONGPRESS!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

