//
//  ViewModel.swift
//  API
//
//  Created by Student03 on 12/12/23.
//

import Foundation


class ViewModel: ObservableObject {
    @Published var listaCardapioIn: [Cardapio] = []
    
    // @Published var listaCardapioOut: Cardapio
    func fetch(){
        
        guard let url = URL(string: "http://127.0.0.1:1880/recover-all-cardapio-ruGETALL") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let parsed = try JSONDecoder().decode([Cardapio].self, from: data)
                
                DispatchQueue.main.async {
                    self?.listaCardapioIn = parsed
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }

    
    
      
}
