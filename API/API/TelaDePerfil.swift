//
//  TelaDePerfil.swift
//  API
//
//  Created by Student14_02 on 07/12/23.
//

import SwiftUI

struct TelaDePerfil: View {
    @State var screenSize: CGSize = .zero

    let tipoUsuario: TipoUsuarioPerfil
    let admin: User = User(nome: "Admin", email: "admin@example.com", matricula: 12345, password: "senha", cargo: "Admin")
    let aluno: User = User(nome: "Aluno", email: "aluno@example.com", matricula: 54321, password: "senha123", cargo: "Aluno")
    
    var usuarioAtual: User {
        switch tipoUsuario {
        case .admin:
            return admin
        case .aluno:
            return aluno
        }
    }
    
    var body: some View {
        ZStack{
            Color("Amarelo")
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Detalhes do Perfil")
                    .font(.title)
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                VStack{
                    Text("Nome: \(usuarioAtual.nome ?? "N/A")")
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                    
                    Text("Email: \(usuarioAtual.email ?? "N/A")")
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                    
                    Text("Matrícula: \(usuarioAtual.matricula ?? 0)")
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                    
                    
                }
                
                
                // Adicione outras informações do perfil aqui, conforme necessário
                
                //
            }
            .padding(40)
            .background(Color("LaranjaFraco"))
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding()
            Spacer()
        }
    }
}

enum TipoUsuarioPerfil {
    case admin
    case aluno
}

struct TelaDePerfil_Previews: PreviewProvider {
    static var previews: some View {
        TelaDePerfil(tipoUsuario: .admin) // Você pode mudar para .aluno para testar o perfil do aluno
    }
}
