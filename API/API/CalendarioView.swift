import SwiftUI

struct CalendarDay: Identifiable, Hashable {
    let id = UUID()
    let day: Int
    let month: Int
    let year: Int
}

struct CalendarGridView: View {
    let startDate: Date
    let endDate: Date
    let onSelectDate: (Int, Int, Int) -> Void

    init(startDate: Date, endDate: Date, onSelectDate: @escaping (Int, Int, Int) -> Void) {
        self.startDate = startDate
        self.endDate = endDate
        self.onSelectDate = onSelectDate
    }

    var body: some View {
        VStack {
            ForEach(monthsBetween(start: startDate, end: endDate), id: \.self) { month in
                Text(month.formatted(.dateTime.year().month()))
                    .font(.title)

                LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 10) {
                    ForEach(daysInMonth(month), id: \.self) { day in
                        Button(action: {
                            self.onSelectDate(day.day, day.month, day.year)
                        }) {
                            Text("\(day.day)")
                                .frame(width: 40, height: 40)
                                .foregroundColor(.primary)
                                .background(Color.blue)
                                .cornerRadius(20)
                        }
                    }
                }
            }
        }
        .padding()
    }

    private func monthsBetween(start: Date, end: Date) -> [Date] {
        var currentDate = start
        var months: [Date] = []

        while currentDate <= end {
            months.append(currentDate)
            guard let newDate = Calendar.current.date(byAdding: .month, value: 1, to: currentDate) else { break }
            currentDate = newDate
        }

        return months
    }

    private func daysInMonth(_ month: Date) -> [CalendarDay] {
        guard let range = Calendar.current.range(of: .day, in: .month, for: month) else {
            return []
        }

        let days: [CalendarDay] = (1...range.count).map { day in
            CalendarDay(day: day, month: Calendar.current.component(.month, from: month), year: Calendar.current.component(.year, from: month))
        }

        return days
    }
}

struct CalendarioView: View {
    @State private var selectedDate: (Int, Int, Int)?

    var body: some View {
        ScrollView {
            CalendarGridView(startDate: Date(), endDate: Date().addingTimeInterval(60 * 60 * 24 * 365).addingTimeInterval(60 * 60 * 24 * 31)) { day, month, year in
                self.selectedDate = (day, month, year)
            }

            if let selectedDate = selectedDate {
                Text("Selected Date: \(selectedDate.0) - \(selectedDate.1) - \(selectedDate.2)")
                    .padding()
            }
        }
    }
}

struct CalendarioView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarioView()
    }
}
