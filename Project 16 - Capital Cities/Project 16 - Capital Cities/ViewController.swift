//
//  ViewController.swift
//  Project 16 - Capital Cities
//
//  Created by Ilgın Akgöz on 5.01.2023.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        
        mapView.addAnnotations([london, oslo, paris, rome, washington])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Map Type", style: .plain, target: self, action: #selector(chooseMapType))
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 1
        guard annotation is Capital else { return nil }
        
        // 2
        let identifier = "Capital"
        
        // 3
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            // 4
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            // 5
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            // 6
            annotationView?.annotation = annotation
        }
        
        annotationView?.markerTintColor = UIColor.purple
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        let placeName = capital.title
        let placeInfo = capital.info
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }

    @objc func chooseMapType() {
        let ac = UIAlertController(title: "Choose map type", message: "", preferredStyle: .actionSheet)
        
        ac.addAction(UIAlertAction(title: "Standard", style: .default, handler: changeMapType))
        ac.addAction(UIAlertAction(title: "Satellite", style: .default, handler: changeMapType))
        ac.addAction(UIAlertAction(title: "Hybrid", style: .default, handler: changeMapType))
        ac.addAction(UIAlertAction(title: "Hybrid Flyover", style: .default, handler: changeMapType))
        ac.addAction(UIAlertAction(title: "Satellite Flyover", style: .default, handler: changeMapType))
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(ac, animated: true)
    }
                     
    func changeMapType(action: UIAlertAction) {
        guard let title = action.title else { return }
        
        switch title {
        case "Standard":
            mapView.mapType = .standard
        case "Satellite":
            mapView.mapType = .satellite
        case "Hybrid":
            mapView.mapType = .hybrid
        case "Hybrid Flyover":
            mapView.mapType = .hybridFlyover
        case "Satellite Flyover":
            mapView.mapType = .satelliteFlyover
        default:
            mapView.mapType = .standard
        }
    }

}

