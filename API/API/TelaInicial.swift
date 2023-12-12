import SwiftUI

struct TelaInicial: View {
    let tipoUsuario: TipoUsuario
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            TelaDePagamento()
                .tabItem {
                    Image(systemName: "dollarsign.circle") // Ícone de cifrão
                    Text("Cifrao")
                }
                .tag(0)
            
            TelaDeCardapio()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle") // Ícone de cardápio
                    Text("Cardápio")
                }
                .tag(1)
            
            if tipoUsuario == .admin {
                CardapioAdmin()
                    .tabItem {
                        Image(systemName: "gearshape.fill") // Ícone de cardápio
                        Text("Admin")
                    }
                    .tag(1)
            }
            
            if tipoUsuario == .admin {
                TelaDePerfilAdmin()
                    .tabItem {
                        Image(systemName: "person.circle") // Ícone de perfil do admin
                        Text("Perfil Admin")
                    }
                    .tag(2)
            } else {
                TelaDePerfilAluno()
                    .tabItem {
                        Image(systemName: "person.circle") // Ícone de perfil do aluno
                        Text("Perfil Aluno")
                    }
                    .tag(2)
            }
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
