//
//  Placeholder.swift
//  Af
//
//  Created by Владимир Свиридов on 08.02.2022.
//

import Foundation

// MARK: - Placeholder
struct Placeholder: Codable {
    let userID, id: Int?
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
