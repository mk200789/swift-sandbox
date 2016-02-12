//
//  ViewController.swift
//  Memorable_places
//
//  Created by Wan Kim Mok on 2/5/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

/*
Goal:
    Table view controller: shows all the user favorite places
    Map page: user view where those places are and allow them to choose new places with long press

*/

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet var map: MKMapView!
    
    var address = ""
    
    //locationManager variable will be used to access location
    var locationManager =  CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("favorite_coordinates") != nil{
            
            let favorite_place_coordinate = NSUserDefaults.standardUserDefaults().objectForKey("favorite_coordinates") as Array<[String: NSNumber]>
            let favorite_place = NSUserDefaults.standardUserDefaults().objectForKey("favorite_places") as Array<String>
            
            for (var i = 0; i<favorite_place.count; i++){
                var annotation = MKPointAnnotation()
                annotation.coordinate.latitude = favorite_place_coordinate[i]["latitude"] as CLLocationDegrees
                annotation.coordinate.longitude = favorite_place_coordinate[i]["longitude"] as CLLocationDegrees
                annotation.title = favorite_place[i]
                map.addAnnotation(annotation)
            }
            
        }
        
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
        
        //variable for longpress and setups and where actions: is the function to be run when longpress is recognized
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        //set the minimum duration have to press down to have the long press recognized
        uilpgr.minimumPressDuration = 2
        
        //add this to the map
        map.addGestureRecognizer(uilpgr)
        
    }

    
    //Called whenever a new location is registered by the phone: Updates map when according to user's location
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [CLLocation]){
        
        //get the 1st user location
        var userLocation : CLLocation = locations[0] as CLLocation
        
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        
        var latDelta : CLLocationDegrees = 0.05
        var lonDelta : CLLocationDegrees = 0.05
        
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: false)
    }

    
    //Called when long press gesture is recognized
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

                    self.address = "\(p.subThoroughfare) \(p.thoroughfare), \(p.locality), \(p.subAdministrativeArea), \(p.postalCode) \(p.country)"
                    
                    //create annotation for favorite place
                    var annotation = MKPointAnnotation()
                    annotation.coordinate = newCoordinate
                    annotation.title = "\(p.subThoroughfare) \(p.thoroughfare), \(p.locality)"
                    annotation.subtitle = "\(p.subAdministrativeArea) \(p.postalCode)"
                    
                    //add annotation to map
                    self.map.addAnnotation(annotation)
                    
                    //favoritePlaces.append(address)
                    //favoritePlacesCoordinate.append(newCoordinate)
                }

            }
        })
        
        if address != ""{
            var temp = NSUserDefaults.standardUserDefaults().objectForKey("favorite_places") as Array<String>
            temp.append(address)
            NSUserDefaults.standardUserDefaults().setObject(temp, forKey: "favorite_places")
            

            var temp2 = NSUserDefaults.standardUserDefaults().objectForKey("favorite_coordinates") as Array<[String: NSNumber]>
            var coord = ["latitude": newCoordinate.latitude, "longitude": newCoordinate.longitude]
            temp2.append(coord)
            NSUserDefaults.standardUserDefaults().setObject(temp2, forKey: "favorite_coordinates")
            
            address = ""
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        let favoriteCoordinates = NSUserDefaults.standardUserDefaults().objectForKey("favorite_coordinates") as Array<[String: NSNumber]>
        
        for coordinate in favoriteCoordinates{
            
            var userLocation = CLLocation(latitude: coordinate["latitude"] as CLLocationDegrees, longitude: coordinate["longitude"] as CLLocationDegrees)
    
            CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler:{ (placemarks, error) -> Void in
                
                if (error != nil){
                    //print(error)
                }
                else{
                    if let p = CLPlacemark(placemark: placemarks[0] as CLPlacemark){
                        
                        var address = "\(p.subThoroughfare) \(p.thoroughfare), \(p.locality), \(p.subAdministrativeArea), \(p.postalCode) \(p.country)"
                        
                        var annotation = MKPointAnnotation()
                        annotation.coordinate.latitude = coordinate["latitude"] as CLLocationDegrees
                        annotation.coordinate.longitude = coordinate["longitude"] as CLLocationDegrees
                        annotation.title = "\(p.subThoroughfare) \(p.thoroughfare), \(p.locality)"
                        annotation.subtitle = "\(p.subAdministrativeArea) \(p.postalCode)"
                        
                        self.map.addAnnotation(annotation)

                    }
                    
                }
            })

        }
        
    }


}

