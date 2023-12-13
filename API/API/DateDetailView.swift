//
//  DateDetailView.swift
//  API
//
//  Created by Student14_02 on 12/12/23.
//

import SwiftUI

struct DateDetailView: View {
    var selectedDate: Date

    var body: some View {
        VStack {
            Text("Data selecionada:")
                .font(.title)
                .padding()

            Text(dateToString(selectedDate))
                .font(.headline)
                .padding()
            
            Spacer()
        }
    }

    func dateToString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
}

struct DateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Aqui você deve fornecer uma data para selectedDate
        let someDate = Date() // Por exemplo, estou usando a data atual

        return DateDetailView(selectedDate: someDate)
    }
}
