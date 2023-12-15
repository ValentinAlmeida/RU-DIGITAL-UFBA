import SwiftUI

struct CardapioAdmin: View {
    @State private var turno: Int = 0
    @State private var bebida: String = ""
    @State private var acompanhamento: [String] = []
    @State private var salada: [String] = []
    @State private var proteina: String = ""
    @State private var vegetariana: String = ""
    @State private var sobremesa: String = ""
    @State private var selectedDate: Date = Date()
    @State private var acompanhamentoText: String = ""
    @State private var saladaText: String = ""
    @State private var pedidos: [Cardapio] = CardapioManager.shared.loadCardapios()
    @State private var showAlert: Bool = false

    var body: some View {
        ZStack{
            Color("LaranjaFraco")
                .ignoresSafeArea()
            VStack {
                Form {
                    Section(header: Text("Detalhes do Cardápio")
                        .font(.title2).bold().foregroundColor(.white))
                    {
                        Picker("Turno", selection: $turno) {
                            Text("Manhã").tag(0)
                            Text("Tarde").tag(1)
                        }

                        TextField("Bebida", text: $bebida)
                        TextField("Proteína", text: $proteina)
                        TextField("Vegetariana", text: $vegetariana)
                        DatePicker("Data", selection: $selectedDate, displayedComponents: .date)
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

                Button("Cadastrar") {
                    let cardapio = Cardapio(turno: turno,
                                            bebida: bebida,
                                            acompanhamento: acompanhamento,
                                            salada: salada,
                                            proteina: proteina,
                                            vegetariana: vegetariana,
                                            sobremesa: sobremesa,
                                            data: selectedDate)
                    pedidos.append(cardapio)
                    CardapioManager.shared.saveCardapios(pedidos)

                    bebida = ""
                    acompanhamento = []
                    salada = []
                    proteina = ""
                    vegetariana = ""
                    sobremesa = ""
                    selectedDate = Date()

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

                Spacer()
            }
            .padding()
        }
    }
}

struct CardapioAdmin_Previews: PreviewProvider {
    static var previews: some View {
        CardapioAdmin()
    }
}

