//
//  Users.swift
//  iOS Test-REST
//
//  Created by Luis Carmona on 31/07/23.
//

import Foundation

enum Gender: String {
    case male
    case female
}

struct Users: Codable {
    let listOfUsers: [User]
    
    enum CodingKeys: String, CodingKey {
        case listOfUsers = "results"
    }
}

struct User: Codable {
    let gender: String?
    let name: Name?
    let location: Location?
    let email: String?
    let login: Login?
    let phone, cell: String?
    let picture: Picture?
}

// MARK: - Location
struct Location: Codable {
    let street: Street?
    let city, state, country: String?
}

// MARK: - Street
struct Street: Codable {
    let number: Int?
    let name: String?
}

// MARK: - Login
struct Login: Codable {
    let uuid, username, password, salt: String?
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String?
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String?
}
