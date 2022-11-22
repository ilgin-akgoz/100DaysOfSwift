//
//  ViewController.swift
//  Project 10 - Names to Faces
//
//  Created by Ilgın Akgöz on 22.11.2022.
//

import UIKit

class ViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as? PersonCell else {
            // we failed to get a PersonCell -- bail out
            fatalError("Unable to dequeue PersonCell.")
        }
        
        // if we're still here it means we got a PersonCell, so we can return it
        return cell
    }


}

