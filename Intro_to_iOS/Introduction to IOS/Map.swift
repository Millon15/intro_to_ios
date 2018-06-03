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
    var checkLocation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        map.mapType = .hybrid;
        map.showsUserLocation = true
        mapAddSchool42Point()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        centerMapOnLocation(location: CLLocation(latitude : myLocation.latitude, longitude : myLocation.longitude))
    }
    
   
    @IBAction func locationButton(_ sender: Any) {
        if !checkLocation {
            showToast(message: "Startin location!")
             locationManager.startUpdatingLocation()
            checkLocation = true
        } else {
            showToast(message: "Stop location!")
            locationManager.stopUpdatingLocation()
            checkLocation = false
        }
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
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-150, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
}

