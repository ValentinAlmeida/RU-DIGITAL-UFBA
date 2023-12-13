//
//  ContentTest.swift
//  API
//
//  Created by Student03 on 12/12/23.
//

import SwiftUI

struct ContentTest: View {
    @StateObject private var viewModel = ViewModel()
    var order: Cardapio = Cardapio.init()
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text("\(order.bebida!)")
            Button("Place Order") {
                Task {
                    await placeOrder(order: order)
                }
            }
            
        }
        .onAppear() {
            viewModel.fetch()
        }
    }
    
    func placeOrder(order: Cardapio) async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "http://127.0.0.1:1880/insert-cardapio-ruPOST")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        do {
            try await URLSession.shared.upload(for: request, from: encoded)
            // handle the result
        } catch {
            print("Checkout failed: \(error.localizedDescription)")
        }
    }
        
}

struct ContentTest_Previews: PreviewProvider {
    static var previews: some View {
        ContentTest()
    }
}
