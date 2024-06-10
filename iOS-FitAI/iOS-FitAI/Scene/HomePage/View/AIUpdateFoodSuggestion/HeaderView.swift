import SwiftUI

struct HeaderView: View {
    let selectedFoodName: String
    var body: some View {
        Text("AI Besin Önerileri")
            .font(.urbanistBold(size: 24))
            .foregroundStyle(Color.black11_11)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 24)
            Text("\(selectedFoodName) yerine yiyebileceğin diğer besinler.")
                .font(.urbanistMedium(size: 14.1))
                .foregroundStyle(Color.black26_27)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 24)
                .padding(.bottom, 24)
        
        
    }
}
