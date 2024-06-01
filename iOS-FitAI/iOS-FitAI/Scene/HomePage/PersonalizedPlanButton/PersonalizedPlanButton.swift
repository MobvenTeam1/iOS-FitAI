import SwiftUI

struct PersonalizedPlanButton: View {
    var imageName: String
    var text: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack(alignment: .center) {
                Color.green126_167
                    .frame(width: 327, height: 66)
                RightCurvedRectangleShape()
                    .fill(Color.green177_235)
                    .frame(width: 100, height: 66)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Image(imageName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 24)
                Image("topofimage")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(.leading, 62)
                    .padding(.top, 12)
                Text(text)
                    .font(.urbanistBold(size: 16))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 114)
                Image("rightarrow")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(.leading, 221)
                    .padding(.top, 37)
            }
            .frame(width: 327, height: 66)
            .cornerRadius(12)
            
        }
        .padding(.top, 24)
    }
}

#Preview {
    HomePageView()
}
