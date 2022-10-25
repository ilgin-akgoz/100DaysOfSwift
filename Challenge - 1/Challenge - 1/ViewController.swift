//
//  ViewController.swift
//  Challenge - 1
//
//  Created by Ilgın Akgöz on 24.10.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries = [String]()
    
    var countryNames = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "World Flags"
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("3x.png") {
                countries.append(item)
            }
        }
        
        countries.sort()
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.image = UIImage(named: countries[indexPath.row])
        content.text = countryNames[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = countries[indexPath.row]
            vc.selectedCountryName = countryNames[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

