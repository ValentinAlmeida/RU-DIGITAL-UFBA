//
//  CardapioManager.swift
//  API
//
//  Created by Student14_02 on 13/12/23.
//

import Foundation

struct CardapioManager {
    static let shared = CardapioManager()

    private let cardapioKey = "SavedCardapio"

    func saveCardapios(_ cardapios: [Cardapio]) {
        do {
            let encodedData = try JSONEncoder().encode(cardapios)
            UserDefaults.standard.set(encodedData, forKey: cardapioKey)
        } catch {
            print("Erro ao codificar os cardápios: \(error.localizedDescription)")
        }
    }

    func loadCardapios() -> [Cardapio] {
        if let savedCardapios = UserDefaults.standard.data(forKey: cardapioKey) {
            do {
                let decodedData = try JSONDecoder().decode([Cardapio].self, from: savedCardapios)
                return decodedData
            } catch {
                print("Erro ao decodificar os cardápios: \(error.localizedDescription)")
            }
        }
        return []
    }
}

