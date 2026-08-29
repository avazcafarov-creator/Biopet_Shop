//
//  User.swift
//  Biopet_Shop
//
//  Created by Avaz Cafarov on 16.08.26.
//

import Foundation

struct User: Codable {
    let name: String
    let surname: String
    let username: String
    let password: String
    let email: String
    let number: String
    let adress: String
    let id: String
    let pet: Pet
}
