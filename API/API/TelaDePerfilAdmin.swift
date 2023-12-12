//
//  TelaDePerfil.swift
//  API
//
//  Created by Student14_02 on 07/12/23.
//

import SwiftUI

struct TelaDePerfilAdmin: View {
    // Supondo que currentUser seja preenchido com os dados do perfil do admin
    let currentUser: User = User(nome: "Admin", email: "admin@example.com", matricula: 12345, password: "senha", cargo: "Admin")
    
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

struct TelaDePerfil_Previews: PreviewProvider {
    static var previews: some View {
        TelaDePerfilAdmin()
    }
}
