//
//  Image.swift
//  Milestone Challenge - 4
//
//  Created by Ilgın Akgöz on 12.12.2022.
//

import UIKit

class Image: NSObject, Codable {
    var name: String
    var caption: String
    
    init(name: String, caption: String) {
        self.name = name
        self.caption = caption
    }
}
