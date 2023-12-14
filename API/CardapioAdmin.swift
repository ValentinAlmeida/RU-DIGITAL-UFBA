import SwiftUI

struct CardapioAdmin: View {
    // Estados para armazenar os detalhes do cardápio
    
    
    @State private var turno: Int = 0
    @State private var bebida: String = ""
    @State private var acompanhamento: [String] = []
    @State private var salada: [String] = []
    @State private var proteina: String = ""
    @State private var vegetariana: String = ""
    @State private var sobremesa: String = ""
    @State private var selectedDate: Date = Date()

    // Estados adicionais para controlar os campos de texto
    @State private var acompanhamentoText: String = ""
    @State private var saladaText: String = ""

    // Binding para a lista de pedidos
    @Binding var pedidos: [Cardapio]

    // Estado para controlar a exibição do alerta
    @State private var showAlert: Bool = false
    
    /// <#Description#>
    var body: some View {
        
        ZStack(){

            Color("LaranjaFraco")
                .ignoresSafeArea()
        
            VStack {
                
                Form {
                  

                    Section(header: Text("Detalhes do Cardápio")
                        .font(.title2).bold().foregroundColor(.white))
                    {
                        // Campo de seleção para o turno
                        
                        Picker("Turno", selection: $turno) {
                            Text("Almoço").tag(0)
                            Text("Jantar").tag(1)
                        }
                        
                        // Campos de texto para os detalhes do cardápio
                        TextField("Bebida", text: $bebida)
                        TextField("Proteína", text: $proteina)
                        TextField("Vegetariana", text: $vegetariana)
                        
                        // Seletor de data
                        DatePicker("Data", selection: $selectedDate, displayedComponents: .date)
                        
                        // Campos de texto com atualização dinâmica
                        TextField("Acompanhamento", text: $acompanhamentoText)
                            .onChange(of: acompanhamentoText) { newValue in
                                acompanhamento = newValue.components(separatedBy: ",")
                            }
                        
                        TextField("Salada", text: $saladaText)
                            .onChange(of: saladaText) { newValue in
                                salada = newValue.components(separatedBy: ",")
                            }
                        
                        TextField("Sobremesa", text: $sobremesa)
                        
                    }
                    
                }
                .scrollContentBackground(.hidden)
                
                // Botão para cadastrar o cardápio
                Button("Cadastrar"){
                    let cardapio = Cardapio(turno: turno,
                                            bebida: bebida,
                                            acompanhamento: acompanhamento,
                                            salada: salada,
                                            proteina: proteina,
                                            vegetariana: vegetariana,
                                            sobremesa: sobremesa,
                                            data: selectedDate)
                    
                    // Adiciona o novo pedido à lista de pedidos
                    pedidos.append(cardapio)
                    
                    // Limpa os campos após a submissão
                    bebida = ""
                    acompanhamento = []
                    salada = []
                    proteina = ""
                    vegetariana = ""
                    sobremesa = ""
                    selectedDate = Date()
                    
                    // Define o estado para exibir o alerta
                    showAlert = true
                }
                .foregroundColor(Color.white)
                .bold()
                .shadow(radius: 10)
                .frame(width: 130, height: 35)
                .background(Color("Amarelo"))
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Cadastro concluído"),
                          message: Text("O cardápio foi cadastrado com sucesso."),
                          dismissButton: .default(Text("OK")))
                }
                .padding()
            } .shadow(radius: 10)
            

            // Espaçador para melhor layout
//            Spacer()
        }
        
//        .padding()
        
    }
}


struct CardapioAdmin_Previews: PreviewProvider {
    static var previews: some View {
        let dummyPedidos: [Cardapio] = []  // Instância fictícia da lista de pedidos

        return CardapioAdmin(pedidos: .constant(dummyPedidos))
    }
}
