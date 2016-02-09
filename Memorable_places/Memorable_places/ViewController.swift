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
        uilpgr.minimumPressDuration = 1
        
        //add this to the map
        map.addGestureRecognizer(uilpgr)
    }
    
    func action(gestureRecognizer: UIGestureRecognizer){

        //touchPoint gives the point where the long pressed on relative to the map in the view
        var touchPoint = gestureRecognizer.locationInView(self.map)
        
        //get the 2D coordinates from touchPoint
        var newCoordinate : CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        let userLocation = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
        

        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler:{ (placemarks, error) -> Void in
            
            if (error != nil){
                //print(error)
            }
            else{
                if let p = CLPlacemark(placemark: placemarks[0] as CLPlacemark){

                    var address = "\(p.thoroughfare), \(p.locality), \(p.subAdministrativeArea), \(p.postalCode) \(p.country)"
                    
                    //create annotation for favorite place
                    var annotation = MKPointAnnotation()
                    annotation.coordinate = newCoordinate
                    annotation.title = "\(p.thoroughfare), \(p.locality)"
                    annotation.subtitle = "\(p.subAdministrativeArea) \(p.postalCode)"
                    
                    //add annotation to map
                    self.map.addAnnotation(annotation)
                    
                    favoritePlaces.append(address)
                }
            }
        })
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

