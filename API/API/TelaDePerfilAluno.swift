//
//  TelaDePerfilAluno.swift
//  API
//
//  Created by Student14_02 on 12/12/23.
//

import SwiftUI

struct TelaDePerfilAluno: View {
    // Supondo que currentUser seja preenchido com os dados do perfil do aluno
    let currentUser: User = User(nome: "Aluno", email: "aluno@example.com", matricula: 54321, password: "senha123", cargo: "Aluno")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Detalhes do Perfil")
                .font(.title)
                .bold()
                .padding()
            
            Text("Nome: \(currentUser.nome ?? "N/A")")
                .padding()
            
            Text("Email: \(currentUser.email ?? "N/A")")
                .padding()
            
            Text("Matrícula: \(currentUser.matricula ?? 0)")
                .padding()
            
            // Adicione outras informações do perfil aqui, conforme necessário
            
            Spacer()
        }
    }
}

struct TelaDePerfilAluno_Previews: PreviewProvider {
    static var previews: some View {
        TelaDePerfilAluno()
    }
}
