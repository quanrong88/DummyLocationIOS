//
//  ViewController.swift
//  DummyLocations
//
//  Created by TaMinhQuan on 08/03/2018.
//  Copyright © 2018 TaMinhQuan. All rights reserved.
//

import UIKit
import SwaggerKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let initialLocation = CLLocation(latitude: 21.033333, longitude: 105.849998)
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.register(MapMakerView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        centerMapOnLocation(location: initialLocation)
        LocationsAPI.requestLocations(completion: { [unowned self] (response, error) in
            if let location = response?.locations {
                let annotation = location.map({(value: Location) -> MapAnnotation in
                    return MapAnnotation(location: value)
                })
                self.mapView.addAnnotations(annotation)
            }
        })
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else {
            return
        }
        detailVC.locationId = sender as? Int32 ?? -1
    }

}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        performSegue(withIdentifier: "detailSegue", sender: view.tag)
    }
}
