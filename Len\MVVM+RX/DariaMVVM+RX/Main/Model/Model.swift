//
//  Model.swift
//  DariaMVVM+RX
//

import Foundation

// MARK: - Data Model
struct User: Decodable {
    let login: String
    let avatarURL: String

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}

