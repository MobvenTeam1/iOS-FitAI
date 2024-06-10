import SwiftUI

struct FoodDetailsView: View {
    let foodItems: [FoodItem]
    @Binding var selectedFoodIndex: Int?
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
            ForEach(foodItems.indices, id: \.self) { item in
                Button {
                    selectedFoodIndex = item
                } label: {
                    ZStack(alignment: .top) {
                        Color.white
                            .frame(width: 158, height: 151)
                            .cornerRadius(12)
                            .shadow(color: selectedFoodIndex == item ? .green177_235.opacity(0.6) : .black.opacity(0.1),
                                    radius: 10, x: 1, y: 1)
                        VStack {
                            ZStack {
                                Color.white247_248
                                    .frame(width: 130, height: 73)
                                if let imageName = foodItems[item].imageName {
                                    Image(imageName)
                                }
                                else {
                                    Color.white247_248
                                        .frame(width: 0, height: 0)
                                }
                            }
                            .padding(.top, 16)
                            VStack(alignment: .leading) {
                                Text(foodItems[item].name)
                                    .font(.urbanistBold(size: 16))
                                    .foregroundStyle(Color.black)
                                Text(foodItems[item].secondaryText)
                                    .font(.urbanistRegular(size: 14))
                                    .foregroundStyle(Color.black102_102)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 14)
                        }
                    }
                    .frame(width: 158, height: 151)
                }
            }
        }
    }
}
