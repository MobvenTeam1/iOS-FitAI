import SwiftUI

struct AnimatedStarView: View {
    @State private var isAnimating = false
    @State private var showParticles = false
    @State private var rotationAngle: Double = 0
    @State private var moveUp = false
    @State private var starOpacity: Double = 0
    @EnvironmentObject var coordinator: Coordinator<FlowRouter>
    @StateObject var appState = AppState()

    var body: some View {
        HomePageView()
            .blur(radius: 10)
            .overlay(
                ZStack {
                    StarImageView(isAnimating: $isAnimating, rotationAngle: $rotationAngle, moveUp: $moveUp, starOpacity: $starOpacity, showParticles: $showParticles)
                    if showParticles {
                        ParticleEmitterView(particles: 75, duration: 2, image: Image("starforanimation"))
                    }
                }
            )
            .onAppear {
                startAnimations()
            }
    }

    private func startAnimations() {
        withAnimation(.easeInOut(duration: 1)) {
            isAnimating = true
            starOpacity = 1
        }
        withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
            rotationAngle = 360
        }
        withAnimation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
            moveUp.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            showParticles = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                coordinator.show(.tabBar)
            }
        }
    }
}
