import SwiftUI

struct TelaInicial: View {
    let tipoUsuario: TipoUsuario
    @State private var selectedTab = 0
    @State private var pedidos: [Cardapio] = []  // Adicione uma lista de pedidos aqui

    var body: some View {
        TabView(selection: $selectedTab) {
            TelaDePagamento()
                .tabItem {
                    Image(systemName: "dollarsign.circle") // Ícone de cifrão
                    Text("Cifrao")
                }
                .tag(0)

            if tipoUsuario == .admin {
                TelaDeCardapio(pedidos: pedidos, tipoUsuario: .admin)
                    .tabItem {
                        Image(systemName: "list.bullet.rectangle") // Ícone de cardápio
                        Text("Cardápio")
                    }
                    .tag(1)
                CardapioAdmin()  // Adicione o binding aqui
                    .tabItem {
                        Image(systemName: "gearshape.fill") // Ícone de cardápio
                        Text("Admin")
                    }
                    .tag(2)  // Lembre-se de ajustar o tag para um valor único
                TelaDePerfil(tipoUsuario: .admin)
                    .tabItem {
                        Image(systemName: "person.circle") // Ícone de perfil do admin
                        Text("Perfil Admin")
                    }
                    .tag(3)  // Ajuste o tag de acordo
            } else {
                TelaDeCardapio(pedidos: pedidos, tipoUsuario: .aluno)
                    .tabItem {
                        Image(systemName: "list.bullet.rectangle") // Ícone de cardápio
                        Text("Cardápio")
                    }
                    .tag(1)
                TelaDePerfil(tipoUsuario: .aluno)
                    .tabItem {
                        Image(systemName: "person.circle") // Ícone de perfil do aluno
                        Text("Perfil Aluno")
                    }
                    .tag(3)  // Ajuste o tag de acordo
            }
        }
        .onAppear(){
            
            UITabBar.appearance().backgroundColor = .systemGray4
        }
        
    }
}

enum TipoUsuario {
    case admin
    case aluno
}

struct TelaInicial_Previews: PreviewProvider {
    static var previews: some View {
        TelaInicial(tipoUsuario: .admin) // Você pode usar .aluno se preferir
    }
}
