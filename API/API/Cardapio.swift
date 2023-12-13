//
//  Cardapio.swift
//  API
//
//  Created by Student14_02 on 07/12/23.
//

import Foundation

// nome do banco de dados node-red = cardapio-ru
struct Cardapio: Hashable, Codable {
    var _id: String?
    var _rev: String?
    var turno: Int? // 0 manhã / 1 tarde
    var bebida: String?
    var acompanhamento: [String]?
    var salada: [String]?
    var proteina: String?
    var vegetariana: String?
    var sobremesa: String?
    var data: Date?
}
