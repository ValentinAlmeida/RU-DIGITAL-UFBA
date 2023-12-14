//
//  Design.swift
//  API
//
//  Created by Student06 on 12/12/23.
//

import SwiftUI

struct Design: View {
    
    var body: some View {
        
        ZStack(){
        
        Color("LaranjaForte")
        
            VStack(){
                
                Text("R.UFBA Digital")
                    .bold()
                    .font(.title)
                    .multilineTextAlignment(.center)

                
                
            }
        }
    
    }
}

struct Design_Previews: PreviewProvider {
    static var previews: some View {
        Design()
    }
}
