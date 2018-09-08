//
//  MapViewController.swift
//  Cities of the World
//
//  Created by Aditya Vikram Godawat on 08/09/18.
//  Copyright © 2018 Aditya Vikram Godawat. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
   
    //MARK: - IBOutlets
    
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK: - Variables
    
    var latitude: Double!
    var longitude: Double!
    var cityName: String!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = cityName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLocationOnMap()
    }
    
    func showLocationOnMap() {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        self.mapView.setRegion(region, animated: true)
    }
}
