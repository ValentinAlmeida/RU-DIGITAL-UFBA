import SwiftUI


struct TelaDeLogin: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color("LaranjaFraco")
                    .ignoresSafeArea()
                VStack {
                    NavigationLink(destination: TelaInicial(tipoUsuario: .admin)) {
                        Text("Tela do Admin")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                    
                    NavigationLink(destination: TelaInicial(tipoUsuario: .aluno)) {
                        Text("Tela do Aluno")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }
            }
        }
    }
}

struct TelaDeLogin_Previews: PreviewProvider {
    static var previews: some View {
        TelaDeLogin()
    }
}
