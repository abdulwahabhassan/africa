//
//  LocationModel.swift
//  Africa
//
//  Created by Hassan Abdulwahab on 07/06/2022.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    //computed property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
