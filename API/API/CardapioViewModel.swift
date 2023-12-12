import Foundation

class CardapioViewModel {
    static func obterCardapio(completion: @escaping ([Cardapio]?) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:1880/cardREADtest") else {
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                let cardapioResponse = try JSONDecoder().decode([Cardapio].self, from: data)
                completion(cardapioResponse)
            } catch {
                print(error)
                completion(nil)
            }
        }

        task.resume()
    }
}
