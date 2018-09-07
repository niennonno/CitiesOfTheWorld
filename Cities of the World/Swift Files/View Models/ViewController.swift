//
//  ViewController.swift
//  Cities of the World
//
//  Created by Aditya Vikram Godawat on 07/09/18.
//  Copyright © 2018 Aditya Vikram Godawat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        accessUrl()
    }

    func accessUrl() {
        
        if let url = Bundle.main.url(forResource: "cities", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let json = try JSONSerialization.jsonObject(with: data) as! [[String: Any]]
                print(json)
            }
            catch let error {
                print(error)
            }   
        }
        
    }


}

