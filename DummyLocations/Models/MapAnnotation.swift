//
//  MapAnnotation.swift
//  DummyLocations
//
//  Created by TaMinhQuan on 08/03/2018.
//  Copyright © 2018 TaMinhQuan. All rights reserved.
//

import UIKit
import MapKit
import SwaggerKit

class MapAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    let locationId: Int32?
    
    
    init(location: Location) {
        locationId = location.id
        title = location.title
        subtitle = location.subtitle
        coordinate = CLLocationCoordinate2D(latitude: Double(location.lat ?? 0), longitude: Double(location.long ?? 0))
        super.init()
    }
    
    

}
