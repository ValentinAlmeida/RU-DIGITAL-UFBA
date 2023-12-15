//
//  TelaDePagamento.swift
//  API
//
//  Created by Student14_02 on 07/12/23.
//

import SwiftUI

struct TelaDePagamento: View {
    
    @State private var text = "Pague essa comanda agora rapaz!"
    
    var body: some View {
        ZStack{
            Color("Amarelo")
                .ignoresSafeArea()
            VStack{
                
                Text("Comprar ticket")
                    .font(.title)
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                
                Image(uiImage: UIImage(data: getQRCodeDate(text: text)!)!)
                    .resizable()
                    .frame(width: 200, height: 200)
            }
        }
    }
    
    func getQRCodeDate(text: String) -> Data? {
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        let data = text.data(using: .ascii, allowLossyConversion: false)
        filter.setValue(data, forKey: "inputMessage")
        guard let ciimage = filter.outputImage else { return nil }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledCIImage = ciimage.transformed(by: transform)
        let uiimage = UIImage(ciImage: scaledCIImage)
        return uiimage.pngData()!
    }
}

struct TelaDePagamento_Previews: PreviewProvider {
    static var previews: some View {
        TelaDePagamento()
    }
}
