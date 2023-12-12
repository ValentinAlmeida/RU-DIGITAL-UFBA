//
//  CardapioAdmin.swift
//  API
//
//  Created by Student17 on 11/12/23.
//

import SwiftUI

struct CardapioAdmin: View {
    @State private var cardapios: [Cardapio] = []

    var body: some View {
        VStack {
            Text("Cardápio")

            List(cardapios, id: \.self) { cardapio in
                VStack(alignment: .leading) {
                    Text("Turno: \(cardapio.turno == 0 ? "Manhã" : "Tarde")")
                    Text("Bebida: \(cardapio.bebida ?? "N/A")")

                    if let acompanhamento = cardapio.acompanhamento {
                        Text("Acompanhamento: \(acompanhamento.joined(separator: ", "))")
                    }

                    if let salada = cardapio.salada {
                        Text("Salada: \(salada.joined(separator: ", "))")
                    }

                    Text("Proteína: \(cardapio.proteina ?? "N/A")")
                    Text("Vegetariana: \(cardapio.vegetariana ?? "N/A")")
                    Text("Sobremesa: \(cardapio.sobremesa ?? "N/A")")

                    if let dia = cardapio.dia, let mes = cardapio.mes, let ano = cardapio.ano {
                        Text("Data: \(dia)/\(mes)/\(ano)")
                    }

                    Spacer()
                }
                .padding()
            }
        }
        .onAppear {
            CardapioViewModel.obterCardapio { cardapios in
                if let cardapios = cardapios {
                    self.cardapios = cardapios
                } else {
                    // Handle error or show an alert
                    print("Error fetching data.")
                }
            }
        }
    }
}

struct CardapioAdmin_Previews: PreviewProvider {
    static var previews: some View {
        CardapioAdmin()
    }
}
