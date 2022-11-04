//
//  Petition.swift
//  Project 7 - Whitehouse Petitions
//
//  Created by Ilgın Akgöz on 4.11.2022.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}

