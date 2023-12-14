import SwiftUI

struct TelaDeCardapio: View {
    var pedidos: [Cardapio]
    let tipoUsuario: TipoUsuarioCardapio
    
    init(pedidos: [Cardapio], tipoUsuario: TipoUsuarioCardapio) {
        self.pedidos = pedidos
        self.tipoUsuario = tipoUsuario
        self.pedidos.append(Cardapio())
        self.pedidos.append(Cardapio(turno: 1))
    }
    
    var body: some View {
        ZStack{
            
            Color("Amarelo")
                .ignoresSafeArea()
            ScrollView{
                VStack{
                    VStack {
                        
                        
                        Text("Cardápio do Almoço")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                        if let cardapioManha = pedidos.first(where: { $0.turno == 0 }), isToday(cardapioManha.data) {
                            // Exibir detalhes do cardápio da manhã
                            Text("Turno: Manhã")
                            Text("Bebida: \(cardapioManha.bebida ?? "")")
                            
                            Text("Acompanhamento: \(cardapioManha.acompanhamento?.joined(separator: ", \n") ?? "")")
                                .lineLimit(1...5)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 12)
                            Text("Salada: \(cardapioManha.salada?.joined(separator: ", ") ?? "")")
                                .lineLimit(1...5)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 12)
                            Text("Proteína: \(cardapioManha.proteina ?? "")")
                            Text("Vegetariana: \(cardapioManha.vegetariana ?? "")")
                            Text("Sobremesa: \(cardapioManha.sobremesa ?? "")")
                            
                            // Adicionar botões de editar e deletar
                            if tipoUsuario == .admin {
                                HStack {
                                    Button("Deletar") {
                                        // Ação de deletar
                                        // Implemente a lógica desejada para a exclusão
                                    }
                                    .padding()
                                    .foregroundColor(.white)
                                }
                            }
                        } else {
                            Text("Cardápio da Manhã não disponível para hoje.")
                        }
                        Spacer()
                    }.background(Color("LaranjaFraco"))
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding()
                    //arredondamento
                    //shadow
                    VStack{
                        
                        Text("Cardápio do Jantar")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                        
                        //Adicionar scrollview
                        
                        if let cardapioTarde = pedidos.first(where: { $0.turno == 1 }), isToday(cardapioTarde.data) {
                            // Exibir detalhes do cardápio da tarde
                            Text("Turno: Tarde")
                            Text("Bebida: \(cardapioTarde.bebida ?? "")")
                            Text("Acompanhamento: \(cardapioTarde.acompanhamento?.joined(separator: ", \n") ?? "")")
                                .lineLimit(1...5)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 12)
                            
                            Text("Salada: \(cardapioTarde.salada?.joined(separator: ", ") ?? "")")
                                .lineLimit(1...5)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 12)
                            Text("Proteína: \(cardapioTarde.proteina ?? "")")
                            Text("Vegetariana: \(cardapioTarde.vegetariana ?? "")")
                            Text("Sobremesa: \(cardapioTarde.sobremesa ?? "")")
                            
                            // Adicionar botões de editar e deletar
                            if tipoUsuario == .admin {
                                HStack {
                                    Button("Deletar") {
                                        // Ação de deletar
                                        // Implemente a lógica desejada para a exclusão
                                    }
                                    .padding()
                                    .foregroundColor(.white)
                                }
                            }
                        } else {
                            Text("Cardápio da Tarde não disponível para hoje.")
                        }
                        Spacer()
                    }
                    .background(Color("LaranjaForte"))
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    //arredondamento
                    //shadow
                    .padding()
                } //.padding(.top, 20)
                
            }
        }
    }
    private func isToday(_ date: Date?) -> Bool {
        guard let date = date else {
            return false
        }
        let calendar = Calendar.current
        return calendar.isDateInToday(date)
    }
}

enum TipoUsuarioCardapio {
    case admin
    case aluno
}

struct TelaDeCardapio_Previews: PreviewProvider {
    static var previews: some View {
        let pedidos: [Cardapio] = []  // Preencha com os pedidos que você tem
        return TelaDeCardapio(pedidos: pedidos, tipoUsuario: .admin)
    }
}
