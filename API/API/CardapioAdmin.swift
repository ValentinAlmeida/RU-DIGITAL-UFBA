import SwiftUI

struct CardapioAdmin: View {
    @State private var cardapios: [Cardapio] = []

    var body: some View {
        NavigationView {
            VStack {
                Text("Cardápio")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                List(cardapios, id: \.self) { cardapio in
                    CardapioItemView(cardapio: cardapio)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        .shadow(radius: 5)
                }

                Spacer()

            }
            .padding()
            .navigationTitle(" RUFBA DIGITAL")
            .navigationBarItems(trailing: Button("Atualizar") {
                // Lógica para recarregar os dados da API aqui
                CarregarCardapio()
            })
        }
        .onAppear {
            // Inicialmente, carregamos os dados do cardápio
            CarregarCardapio()
        }
    }

    private func CarregarCardapio() {
        CardapioViewModel.obterCardapio { cardapios in
            if let cardapios = cardapios {
                self.cardapios = cardapios
            } else {
                // Handle error or show an alert
                print("Erro ao carregar os dados do cardápio.")
            }
        }
    }
}

struct CardapioItemView: View {
    let cardapio: Cardapio

    var body: some View {
        VStack(alignment: .leading) {
            Text("Turno: \(cardapio.turno == 0 ? "Manhã" : "Tarde")")
                .font(.headline)
                .fontWeight(.bold)
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
        }
        .foregroundColor(Color.black)
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
    }
}

struct CardapioAdmin_Previews: PreviewProvider {
    static var previews: some View {
        CardapioAdmin()
    }
}
