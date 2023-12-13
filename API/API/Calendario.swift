import SwiftUI

struct Calendario: View {
    private let calendar = Calendar.current
    @State private var currentDate = Date()
    @State private var selectedDate: DateIdentifiable?

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        self.currentDate = self.getPreviousMonth()
                    }) {
                        Image(systemName: "arrow.left.circle")
                            .font(.title)
                            .padding()
                    }

                    Text(getMonthYearHeader())
                        .font(.title)
                        .padding()

                    Button(action: {
                        self.currentDate = self.getNextMonth()
                    }) {
                        Image(systemName: "arrow.right.circle")
                            .font(.title)
                            .padding()
                    }
                }

                // Exibir o calendário para o mês atual
                VStack {
                    ForEach(getWeeksInMonth(), id: \.self) { week in
                        HStack {
                            ForEach(week, id: \.self) { day in
                                Button(action: {
                                    self.selectedDate = DateIdentifiable(date: self.getDateFromDayString(day)!)
                                }) {
                                    Text(day)
                                        .frame(width: 30, height: 30)
                                        .padding(5)
                                }
                            }
                        }
                    }
                }
            }
            .sheet(item: $selectedDate) { date in
                DateDetailView(selectedDate: date.date)
            }
        }
    }

    // Obter cabeçalho do mês e ano
    func getMonthYearHeader() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: currentDate)
    }

    // Obter as semanas no mês para o mês atual
    func getWeeksInMonth() -> [[String]] {
        var weeks: [[String]] = []
        var components = calendar.dateComponents([.year, .month], from: currentDate)
        if let startDate = calendar.date(from: components),
           let range = calendar.range(of: .day, in: .month, for: startDate) {

            var currentWeek: [String] = Array(repeating: "", count: 7)
            var index = 0

            for i in 1...range.count {
                components.day = i
                if let date = calendar.date(from: components) {
                    let weekday = calendar.component(.weekday, from: date)
                    currentWeek[index] = "\(i)"
                    index += 1

                    if weekday == 7 || i == range.count {
                        weeks.append(currentWeek)
                        currentWeek = Array(repeating: "", count: 7)
                        index = 0
                    }
                }
            }
        }
        return weeks
    }

    // Obter o próximo mês
    func getNextMonth() -> Date {
        return calendar.date(byAdding: .month, value: 1, to: currentDate) ?? Date()
    }

    // Obter o mês anterior
    func getPreviousMonth() -> Date {
        return calendar.date(byAdding: .month, value: -1, to: currentDate) ?? Date()
    }

    // Função para obter a data selecionada a partir do dia em string
    func getDateFromDayString(_ dayString: String) -> Date? {
        guard let day = Int(dayString) else { return nil }

        var components = calendar.dateComponents([.year, .month], from: currentDate)
        components.day = day
        return calendar.date(from: components)
    }

    // Estrutura que adota Identifiable para envolver a data
    struct DateIdentifiable: Identifiable {
        var id: Date { date }
        let date: Date
    }
}

struct Calendario_Previews: PreviewProvider {
    static var previews: some View {
        Calendario()
    }
}
