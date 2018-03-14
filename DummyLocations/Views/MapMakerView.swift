//
//  MapMakerView.swift
//  DummyLocations
//
//  Created by TaMinhQuan on 08/03/2018.
//  Copyright © 2018 TaMinhQuan. All rights reserved.
//

import UIKit
import MapKit

class MapMakerView: MKMarkerAnnotationView {

    override var annotation: MKAnnotation? {
        willSet {
            guard let mapAnnotation = newValue as? MapAnnotation else { return }
            tag = Int(mapAnnotation.locationId ?? -1) 
        }
    }

}
