//
//  BirthdayView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 28.05.2024.
//

import SwiftUI

struct BirthdayView: View {
    @ObservedObject var personalInfoVM: PersonalInfosViewModel
    @Binding var progressBarValue: Double
    @State var birthDate: Date = Date.now
    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.birthdayViewTitle)
                HStack(spacing: 20) {
                    Text(birthDate.formatted(.dateTime.day()))
                        .font(.system(size: 13, weight: .semibold))
                        .padding(12)
                        .border(.calenderBorder)
                    Text(birthDate.formatted(.dateTime.month()))
                        .font(.system(size: 13, weight: .semibold))
                        .padding(12)
                        .border(.calenderBorder)
                    Text(birthDate.formatted(.dateTime.year()))
                        .font(.system(size: 13, weight: .semibold))
                        .padding(12)
                        .border(.calenderBorder)
                    Image("calender")
                    
                        .border(.calenderBorder)
                }
                .padding(8)
                .foregroundColor(.black)
                .overlay {
                    DatePicker(selection: $birthDate, displayedComponents: .date) {}
                        .labelsHidden()
                        .contentShape(Rectangle())
                        .opacity(0.011)
                }
                .padding()
                Spacer()
                MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextNext,buttonBackgroundColor: .buttonGreen){
                    progressBarValue += 0.16
                    personalInfoVM.pageStep = .targets
                    // Tarihi ISO 8601 formatına dönüştür
                    //a
                    if let isoDate = createFullDate(from: birthDate) {
                        personalInfoVM.personalInfoData.dateOfBirth = isoDate
                    }
                    //b
                }
                .padding(.bottom, 30)
                
                
                
            }
            .onAppear(perform: {
                progressBarValue = 0.8
                
            })
            //            .onChange(of: birthDate) {
            //                personalInfoVM.personalInfoData.dateOfBirth = birthDate
            //            }
            
            //a
            .onChange(of: birthDate) { newValue in
                if let isoDate = createFullDate(from: newValue) {
                    personalInfoVM.personalInfoData.dateOfBirth = isoDate
                }
            }
            //b
            
        }
    }
    //a
    func createFullDate(from date: Date) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)  // UTC zaman dilimi
        
        // Kullanıcıdan alınan tarihi string formatına çevirin
        let dateString = DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .none)
        let fullDateString = "\(dateString)T00:00:00.000Z"
        
        return dateFormatter.date(from: fullDateString)
    }
    //b
}

#Preview {
    BirthdayView(personalInfoVM: PersonalInfosViewModel(), progressBarValue: .constant(0.2))
}
