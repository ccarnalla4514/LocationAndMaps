//
//  ViewController.swift
//  LocationAndMaps
//
//  Created by Christian Carnalla on 5/12/21.
//

import UIKit
import CoreLocation
import MapKit
class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userLocation.title = "My Location"
    
    addPinAnnotationToMapView()
    
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            textView.text = "\(location)"
        }
    }
    func addPinAnnotationToMapView(){
        let coordinate = CLLocationCoordinate2D(latitude: 68, longitude: -12.4230)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Title"
        annotation.subtitle = "Subtitle"
        mapView.addAnnotation(annotation)
        setCenterOfMapToLocation(location: coordinate)
    }
    func setCenterOfMapToLocation(location: CLLocationCoordinate2D){
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
    }
    
    


}
