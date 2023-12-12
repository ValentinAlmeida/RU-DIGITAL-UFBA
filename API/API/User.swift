//
//  User.swift
//  RU-DIGITAL-UFBA
//
//  Created by Student03 on 07/12/23.
//

import Foundation

// 0 usuário comum, 1 usuário bolsista, 2 admin-1 (cadastrar cardápio e bolsista), 3 admim-2 (verificar QRcode)
// Nome do banco node-red = user-ru
struct User: Hashable, Codable {
    var nome: String?
    var email: String?
    var matricula: Int?
    var password: String?
    var cargo: String?
}
