import SwiftUI

import SwiftUI

struct TelaInicial: View {
    @State private var selectedTab = 0
    @State private var teste = true
    
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
                
                TelaDePerfil()
                    .tabItem {
                        Image(systemName: "person.circle") // Ícone de perfil
                        Text("Perfil")
                    }
                    .tag(2)
            }
    }
}

struct TelaInicial_Previews: PreviewProvider {
    static var previews: some View {
        TelaInicial()
    }
}
