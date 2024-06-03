import SwiftUI

struct NutritionPlanningSubView: View {
    @Binding var isNutritionTapped: Bool
    let typeOfMeal: String
    let duration: String
    let calories: String
    var body: some View {
        VStack {
            Text("Kişiselleştirilmiş Beslenme Planı")
                .font(.urbanistBold(size: 18))
                .foregroundStyle(Color.black11_11)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 33)
                .padding(.top, 22)
            Button(action: { isNutritionTapped.toggle() }) {
                ZStack {
                        Image("kahvaltıbackground")
                    HStack {
                        Text(typeOfMeal)
                            .foregroundStyle(.white)
                            .font(.urbanistBold(size: 24))
                        Spacer()
                        Image(systemName: isNutritionTapped ? "chevron.up" : "chevron.down")
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal, 38)
                    .offset(y: -16)
                    HStack {
                        Image("clock")
                            .padding(.trailing, -4)
                        Text(duration)
                        Image("caloriesmeal")
                            .padding(.trailing, -4)
                        Text(calories)
                    }
                    .foregroundStyle(.white)
                    .font(.urbanistRegular(size: 16))
                    .offset(x: -54, y: 20)
                }
                .frame(width: 327, height: 102)
            }
            if isNutritionTapped {
                NutritionPlanningView(headerImageName: "kahvaltı2", foodImageName: "yumurta", foodName: "Haşlanmış Yumurta", secondaryText: "2 tane 180kcal")
            }
        }
    }
}


