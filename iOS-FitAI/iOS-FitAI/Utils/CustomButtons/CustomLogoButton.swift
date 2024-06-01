import SwiftUI
struct CustomLogoButton: ViewModifier {
 
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
//                        HomePageView()
                    } label: {
                        Image("fitaiimage")
                            .resizable()
                            .frame(width: 32, height: 36)
                    }
                }
            }
    }
}

extension View {
    func customLogoButton() -> some View {
        self.modifier(CustomLogoButton())
    }
}
