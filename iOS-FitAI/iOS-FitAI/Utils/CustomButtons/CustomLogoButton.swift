import SwiftUI
struct CustomLogoButton: ViewModifier {
 
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        TabBarView() // TODO: its gonna change
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
