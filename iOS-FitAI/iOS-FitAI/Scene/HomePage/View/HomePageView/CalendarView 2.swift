import SwiftUI

struct CalendarView: View {
    let days = lastSevenDays()
    @State private var selectedDate: Date? = nil
    
    var body: some View {
        VStack {
            HStack {
                ForEach(days, id: \.self) { day in
                    HStack {
                        if selectedDate == day {
                            selectedDayView(day: day)
                        } else {
                            defaultDayView(day: day)
                        }
                    }
                    .onTapGesture {
                        selectedDate = day
                    }
                }
            }
            .padding()
        }
        .frame(height: 68)
        .padding(.top, -16)
        .padding(.horizontal, -5)
        .onAppear {
            selectedDate = days.first(where: { Calendar.current.isDate($0, inSameDayAs: Date()) })
        }
    }
    
    func dayNumber(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        formatter.locale = Locale(identifier: "tr_TR")
        return formatter.string(from: date)
    }
    
    func dayName(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        formatter.locale = Locale(identifier: "tr_TR")
        return formatter.string(from: date)
    }
    
    func selectedDayView(day: Date) -> some View {
        ZStack(alignment: .top) {
            Text(dayName(day))
                .offset(y: -10)
                .font(.custom("Gilroy-Black", size: 12))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .frame(width: 46, height: 68)
                .background(Color.green177_235)
                .cornerRadius(149)
            ZStack {
                Color.white
                    .frame(width:30, height: 30)
                    .clipShape(Circle())
                    .offset(y: 10)
                Text(dayNumber(day))
                    .font(.system(size: 14))
                    .offset(y: 10)
                    .frame(width: 30, height: 30)
            }
        }
    }
    
    func defaultDayView(day: Date) -> some View {
        ZStack(alignment: .top) {
            Text(dayName(day))
                .offset(y: -10)
                .font(.custom("Gilroy-Black", size: 12))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .frame(width: 46, height: 68)
                .background(.white)
                .cornerRadius(149)
            ZStack {
                Color.white
                    .frame(width:30, height: 30)
                    .clipShape(Circle())
                    .offset(y: 10)
                Text(dayNumber(day))
                    .font(.system(size: 14))
                    .offset(y: 10)
                    .frame(width: 30, height: 30)
            }
        }
    }
}

func lastSevenDays() -> [Date] {
    let today = Date()
    return (0..<7).map { i in
        Calendar.current.date(byAdding: .day, value: -i, to: today)!
    }.reversed()
}

#Preview {
    CalendarView()
}
