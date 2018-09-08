//
//  ViewController.swift
//  Cities of the World
//
//  Created by Aditya Vikram Godawat on 07/09/18.
//  Copyright © 2018 Aditya Vikram Godawat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: - Variables
    
    var cities = [City]()
    var filteredCities = [City]()
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readFromFile()
    }
    
    //MARK: - User Actions

    func readFromFile() {
        
        if let url = Bundle.main.url(forResource: "cities", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let jsonArray = try JSONSerialization.jsonObject(with: data) as! [[String: Any]]
                
                for json in jsonArray {
                    cities.append(City(json: json))
                }
                cities.sort { $0.cityName < $1.cityName }
                filteredCities = cities
            }
            catch let error {
                print(error)
            }   
        }
        
    }
}


//MARK: - Table View Data Source and Delegates

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredCities[indexPath.row].cityName + ", " + filteredCities[indexPath.row].countryName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = filteredCities[indexPath.row]
        let mapViewController = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        mapViewController.cityName = city.cityName
        mapViewController.latitude = city.latitude
        mapViewController.longitude = city.longitude
        
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(mapViewController, animated: true)
    }
}

//MARK: - Search Bar Delegates

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
                
        filteredCities = cities.filter({ (city) -> Bool in
            return city.cityName.hasPrefix(searchText)
        })
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
}
