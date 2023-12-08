//
//  User.swift
//  RU-DIGITAL-UFBA
//
//  Created by Student03 on 07/12/23.
//

import Foundation

struct User: Hashable, Codable {
    var _id: String?
    var _rev: String?
    var nome: String?
    var email: String?
    var matricula: Int?
    var password: String?
    var cargo: Int?
}
