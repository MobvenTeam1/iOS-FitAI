import SwiftUI

struct StarImageView: View {
    @Binding var isAnimating: Bool
    @Binding var rotationAngle: Double
    @Binding var moveUp: Bool
    @Binding var starOpacity: Double
    @Binding var showParticles: Bool
    let dismiss: DismissAction
    
    var body: some View {
        Image("starforanimation")
            .resizable()
            .frame(width: 149, height: 149)
            .scaleEffect(isAnimating ? 1.0 : 0.1)
            .rotationEffect(.degrees(rotationAngle))
            .opacity(starOpacity)
            .offset(y: moveUp ? -3 : 3)
    }
}
