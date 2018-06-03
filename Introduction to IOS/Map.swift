//
//  FirstViewController.swift
//  Introduction to IOS
//
//  Created by Anton MOLCHAN on 02.06.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class Map: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    

    let locationManager = CLLocationManager()
    var currentLocation : CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.mapType = .standard;
        mapAddSchool42Point()

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("sama ne vizivaetsa")
//        let location = locations[0]
//
//        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
//
//        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
//
//        currentLocation.center = myLocation
//        currentLocation.span = span
//
////        if (follow) {
//            map.setRegion(currentLocation, animated: true)
////        }
//        map.showsUserLocation = true
    }
    
    @IBAction func locationButton(_ sender: Any) {
        
    }
    
    @IBAction func mapChanger(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            map.mapType = .standard;
            break;
        case 1:
            map.mapType = .satellite;
            break;
        default:
            map.mapType = .hybrid;
            break;
            
        }
    }
    
    func mapAddSchool42Point() {
        centerMapOnLocation(location : CLLocation(latitude: 48.8965488, longitude: 2.3184608))
        let school42 = MKPointAnnotation();
        school42.title = "Ecole 42"
        school42.subtitle = "Cybercafé, Hôtel et Cinéma"
        school42.coordinate = CLLocationCoordinate2D(latitude: 48.8965488, longitude: 2.3184608);
        map.addAnnotation(school42)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        map.setRegion(coordinateRegion, animated: true)
    }
    
}

