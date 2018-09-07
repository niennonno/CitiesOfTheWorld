//
//  City.swift
//  Cities of the World
//
//  Created by Aditya Vikram Godawat on 07/09/18.
//  Copyright © 2018 Aditya Vikram Godawat. All rights reserved.
//

import Foundation

class City {
    var countryName: String!
    var cityName: String!
    var latitude: Double!
    var longitude: Double!
    
    init(json: [String: Any]) {
        countryName = json["country"] as! String
        cityName = json["name"] as! String
        let coord = json["coord"] as! [String: Any]
        latitude = coord["lat"] as! Double
        longitude = coord["lon"] as! Double
    }
}


