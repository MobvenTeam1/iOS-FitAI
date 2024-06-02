import SwiftUI

struct StartButton: View {
    @Binding var showAnimation: Bool
    var body: some View {
        GreenButtonView(text: "Başla") {
            showAnimation = true
        }
    }
}
