//
//  DetailViewController.swift
//  Challenge - 1
//
//  Created by Ilgın Akgöz on 25.10.2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var selectedCountryName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        if let countryName = selectedCountryName {
            title = countryName
        }
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    

   

}
