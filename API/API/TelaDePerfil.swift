//
//  TelaDePerfil.swift
//  API
//
//  Created by Student14_02 on 07/12/23.
//

import SwiftUI

struct TelaDePerfil: View {
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
        VStack(alignment: .leading, spacing: 20) {
            Text("Detalhes do Perfil")
                .font(.title)
                .bold()
                .padding()
            
            Text("Nome: \(usuarioAtual.nome ?? "N/A")")
                .padding()
            
            Text("Email: \(usuarioAtual.email ?? "N/A")")
                .padding()
            
            Text("Matrícula: \(usuarioAtual.matricula ?? 0)")
                .padding()
            
            // Adicione outras informações do perfil aqui, conforme necessário
            
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
