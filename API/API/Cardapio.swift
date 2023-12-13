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
    
    init(
        turno: Int = 0,
        bebida: String = "Suco",
        acompanhamento: [String] = ["Feijão e Arroz", "Macarrão"],
        salada: [String] = ["Alface e Tomate", "Acelga"],
        proteina: String = "Carne Assada",
        vegetariana: String = "Soja",
        sobremesa: String = "Brigadeiro",
        data: Date = Date()
        )
    {
        self.turno = turno
        self.bebida = bebida
        self.acompanhamento = acompanhamento
        self.salada = salada
        self.proteina = proteina
        self.vegetariana = vegetariana
        self.sobremesa = sobremesa
        self.data = data
    }
}
