import SwiftUI

struct CaloriesView: View {
    var imageName: String
    var firstText: String
    var calorieText: String
    var body: some View {
        ZStack {
            Color.white
            VStack(alignment: .leading) {
                Image(imageName)
                    .resizable()
                    .frame(width: 32, height: 32)
                Text(firstText)
                    .font(.urbanistMedium(size: 12))
                    .foregroundStyle(Color.black102_102)
                Text(calorieText)
                    .font(.urbanistBold(size: 14))
                    .foregroundStyle(Color.black26_27)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
        }
        .frame(width: 104, height: 92)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 50, x: 1, y: 1)
        .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(white: 246.0 / 255.0), lineWidth: 1)
                )
//        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 12)
        
        
    }
}
