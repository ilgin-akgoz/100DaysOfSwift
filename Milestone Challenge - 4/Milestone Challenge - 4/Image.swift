//
//  Image.swift
//  Milestone Challenge - 4
//
//  Created by Ilgın Akgöz on 12.12.2022.
//

import UIKit

class Image: NSObject, Codable {
    var imageName: String
    var caption: String
    
    init(imageName: String, caption: String) {
        self.imageName = imageName
        self.caption = caption
    }
}
