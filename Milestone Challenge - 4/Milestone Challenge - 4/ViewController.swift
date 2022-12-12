//
//  ViewController.swift
//  Milestone Challenge - 4
//
//  Created by Ilgın Akgöz on 12.12.2022.
//

import UIKit

class ViewController: UITableViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var image = [Image]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(addNewPhoto))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return image.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Image", for: indexPath) as? ImageCell else {
            fatalError("Unable to dequeue ImageCell.")
        }
        
        cell.caption.text = image[indexPath.row].imageName
        
        
        
        return cell
    }

    @objc func addNewPhoto() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    

}

