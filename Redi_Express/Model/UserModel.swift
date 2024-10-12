//
//  UserModel.swift
//  Redi_Express
//
//  Created by user on 12.10.2024.
//

import Foundation

struct UserModel: Codable {
    var id: UUID
    var name: String
    var phone: String
    var created_at: Date
}
