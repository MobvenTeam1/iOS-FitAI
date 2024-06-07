import SwiftUI

struct RememberMeSection: View {
    @Binding var rememberMeClicked: Bool
    var body: some View {
        Button {
            rememberMeClicked.toggle()
        }label: {
            if rememberMeClicked {
                Image("tikişareti")
            }
            else {
                Image(systemName: "circle")
                    .resizable()
                    .frame(width: 17, height: 17)
                    .foregroundStyle(Color.black11_11)
            }
        }
        .padding(.leading, 16)
        Text("Beni Hatırla")
            .font(.urbanistSemibold(size: 14))
            .foregroundStyle(Color.black84_84)
    }
}
