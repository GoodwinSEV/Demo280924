//
//  UserModel.swift
//  Demo_8
//
//  Created by User on 28.09.2024.
//

import Foundation

struct UserModel: Codable {
    var id: UUID
    var name: String
    var phone: String
    var created_at: Date
}
