//
//  ViewModel.swift
//  API
//
//  Created by Student03 on 12/12/23.
//

import Foundation


class ViewModel: ObservableObject {
    @Published var bibleBooks: [Cardapio] = []
    
    func fetch(){
        
        guard let url = URL(string: "https://www.abibliadigital.com.br/api/books") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let parsed = try JSONDecoder().decode([BibleBooks].self, from: data)
                
                DispatchQueue.main.async {
                    self?.bibleBooks = parsed
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
