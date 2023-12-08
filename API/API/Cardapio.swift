//
//  Cardapio.swift
//  API
//
//  Created by Student14_02 on 07/12/23.
//

import Foundation

struct Cardapio: Hashable, Codable {
    var _id: String?
    var _rev: String?
    var bebida: String?
    var acompanhamento: [String]?
    var salada: [String]?
    var proteina: String?
    var vegetariana: String?
    var sobremesa: String?
}
