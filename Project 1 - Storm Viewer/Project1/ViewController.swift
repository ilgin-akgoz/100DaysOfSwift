//
//  ViewController.swift
//  Project1
//
//  Created by Ilgın Akgöz on 14.10.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(recommendToPeople))
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        performSelector(inBackground: #selector(loadImages), with: nil)
        tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)

    }
    
    @objc func loadImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        pictures.sort()
    }
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // success, set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            
            vc.selectedPictureNumber = indexPath.row + 1
            
            vc.totalPictures = pictures.count
            
            // push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func recommendToPeople() {
        let vc = UIAlertController(title: "Recommend the app to others!", message: "", preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "OK", style: .default))
        present(vc, animated: true)
    }


}

