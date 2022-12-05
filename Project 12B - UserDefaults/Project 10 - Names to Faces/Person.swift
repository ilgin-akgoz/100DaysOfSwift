//
//  Person.swift
//  Project 10 - Names to Faces
//
//  Created by Ilgın Akgöz on 23.11.2022.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
