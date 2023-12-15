import SwiftUI

struct TelaDeCardapio: View {
    @State private var pedidos: [Cardapio] = []
    let tipoUsuario: TipoUsuarioCardapio

    init(pedidos: [Cardapio], tipoUsuario: TipoUsuarioCardapio) {
        self.pedidos = pedidos
        self.tipoUsuario = tipoUsuario
    }

    var body: some View {
        VStack {
            Text("Cardápio do Almoço")
                .font(.title)
                .padding()

            if let cardapioManha = pedidos.first(where: { $0.turno == 0 }), isToday(cardapioManha.data) {
                // Exibir detalhes do cardápio da manhã
                Text("Bebida: \(cardapioManha.bebida ?? "")")
                Text("Acompanhamento: \(cardapioManha.acompanhamento?.joined(separator: ", ") ?? "")")
                Text("Salada: \(cardapioManha.salada?.joined(separator: ", ") ?? "")")
                Text("Proteína: \(cardapioManha.proteina ?? "")")
                Text("Vegetariana: \(cardapioManha.vegetariana ?? "")")
                Text("Sobremesa: \(cardapioManha.sobremesa ?? "")")

                // Adicionar botões de editar e deletar
                if tipoUsuario == .admin {
                    HStack {
                        Button("Deletar") {
                            deleteItem(cardapioManha)
                        }
                        .padding()
                        .foregroundColor(.red)
                    }
                }
            } else {
                Text("Cardápio da Manhã não disponível para hoje.")
            }

            Text("Cardápio do Jantar")
                .font(.title)
                .padding()

            if let cardapioTarde = pedidos.first(where: { $0.turno == 1 }), isToday(cardapioTarde.data) {
                // Exibir detalhes do cardápio da tarde
                Text("Bebida: \(cardapioTarde.bebida ?? "")")
                Text("Acompanhamento: \(cardapioTarde.acompanhamento?.joined(separator: ", ") ?? "")")
                Text("Salada: \(cardapioTarde.salada?.joined(separator: ", ") ?? "")")
                Text("Proteína: \(cardapioTarde.proteina ?? "")")
                Text("Vegetariana: \(cardapioTarde.vegetariana ?? "")")
                Text("Sobremesa: \(cardapioTarde.sobremesa ?? "")")

                // Adicionar botões de editar e deletar
                HStack {
                    Button("Deletar") {
                        deleteItem(cardapioTarde)
                    }
                    .padding()
                    .foregroundColor(.red)
                }
            } else {
                Text("Cardápio da Tarde não disponível para hoje.")
            }
        }.onAppear(){
            pedidos  = CardapioManager.shared.loadCardapios()
        }
        .padding()
    }

    private func isToday(_ date: Date?) -> Bool {
        guard let date = date else {
            return false
        }
        let calendar = Calendar.current
        return calendar.isDateInToday(date)
    }
    private func deleteItem(_ cardapio: Cardapio) {
        if let index = pedidos.firstIndex(where: { $0 == cardapio }) {
            pedidos.remove(at: index)
            CardapioManager.shared.saveCardapios(pedidos)
        }
    }
}

enum TipoUsuarioCardapio {
    case admin
    case aluno
}

struct TelaDeCardapio_Previews: PreviewProvider {
    static var previews: some View {
        // Criando alguns pedidos fictícios para a pré-visualização
        let pedidos: [Cardapio] = [
            Cardapio(turno: 0, bebida: "Água", acompanhamento: ["Arroz", "Feijão"], salada: ["Alface", "Tomate"], proteina: "Frango", vegetariana: "", sobremesa: "Pudim", data: Date()),
            Cardapio(turno: 1, bebida: "Suco", acompanhamento: ["Macarrão"], salada: ["Rúcula"], proteina: "Peixe", vegetariana: "Legumes", sobremesa: "Fruta", data: Date())
        ]
        
        return TelaDeCardapio(pedidos: pedidos, tipoUsuario: .admin)
    }
}
