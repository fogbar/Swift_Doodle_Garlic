//
//  ViewController.swift
//  AlamofireTutorial
//
//  Created by garlic on 2020/06/26.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let service = Service(baseUrl: "https://restcountries.eu/rest/v2/")
        service.getAllCountryNameFrom(endPoint: "all")
        service.completionHandler { (countries, status, message) in
            if status {
                //guard let self = self else {return}
                guard let _countries = countries else {return}
                self.countries = _countries
                self.tableView.reloadData()
                
            }
        }
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "countryCell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "countryCell")
        }
        let country = countries[indexPath.row]
        
        cell?.textLabel?.text = (country.name ?? "") + "" + "(\(country.countryCode ?? ""))"
        cell?.detailTextLabel?.text = country.capital ?? ""
        
        return cell!
    }
    
}

