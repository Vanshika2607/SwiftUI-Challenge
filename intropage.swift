import SwiftUI


struct WelcomeScreen: View {
    let onStarted: () -> Void

    var body: some View {
        ZStack {

            // Soft lavender background — matches reference image
            Color(red: 0.05, green: 0.05, blue: 0.07)
                .ignoresSafeArea()

            VStack(spacing: 0) {

                // ── TOP: Illustration area ──
                ZStack {

                    // Soft blob behind figure
                    Ellipse()
                        .fill(Color.blue.opacity(0.15))
                        .frame(width: 270, height: 230)
                        .offset(y: 25)

                    // Physio figure
                    Image("reable")
                        .resizable()
                            .scaledToFill()
                            .frame(width: 220, height: 200)
                            .clipShape(Circle())
                            .shadow(color: .purple.opacity(0.3), radius: 20, x: 0, y: 10)
                            .offset(y: 20)

                    // App name — top left
                    HStack(spacing: 0) {
                        Text("Re")
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundColor(.blue)
                        Text("Able")
                            .font(.system(size: 26, weight: .light, design: .rounded))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(.leading, 24).padding(.top, 18)

                    // Leaf accent — top right (like reference)
                    Image(systemName: "leaf.fill")
                        .font(.system(size: 26))
                        .foregroundColor(Color.blue.opacity(0.4))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        .padding(.trailing, 22).padding(.top, 16)

                    // Decorative dots
                    Circle()
                        .fill(Color.blue.opacity(0.3))
                        .frame(width: 11, height: 11)
                        .offset(x: 135, y: -85)

                    Circle()
                        .fill(Color.blue.opacity(0.2))
                        .frame(width: 7, height: 7)
                        .offset(x: -128, y: 45)
                }
                .frame(height: 350)

                // ── BOTTOM: White card — matches reference bottom sheet ──
                ZStack(alignment: .top) {

                    RoundedRectangle(cornerRadius: 38)
                        .fill(Color(red: 0.12, green: 0.12, blue: 0.14))
                        .shadow(color: .black.opacity(0.3), radius: 24, x: 0, y: -6)

                    VStack(alignment: .leading, spacing: 0) {

                        // Title
                        Text("Recover Smarter,\nMove Better")
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .lineSpacing(4)
                            .padding(.bottom, 12)

                        // One-line description
                        Text("Personalised physio exercises for your condition — safe, guided & fully offline.")
                            .font(.system(size: 14))
                            .foregroundColor(Color.white.opacity(0.7))
                            .lineSpacing(5)
                            .padding(.bottom, 28)

                        // Feature chips
                        HStack(spacing: 8) {
                            FeatureChip(icon: "🛡️", label: "Safe")
                            FeatureChip(icon: "📴", label: "Offline")
                            FeatureChip(icon: "🎯", label: "Personalised")
                        }
                        .padding(.bottom, 32)

                        // Get Started button — purple gradient like reference
                        Button {
                            onStarted()
                        } label: {
                            HStack(spacing: 10) {
                                Text("Get Started")
                                    .font(.system(size: 17, weight: .semibold))
                                Image(systemName: "arrow.right")
                                    .font(.system(size: 15, weight: .semibold))
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(
                                LinearGradient(
                                    colors: [
                                        Color(red: 0.52, green: 0.32, blue: 0.92),
                                        Color(red: 0.75, green: 0.32, blue: 0.88)
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                            .shadow(
                                color: Color(red: 0.52, green: 0.32, blue: 0.92).opacity(0.38),
                                radius: 14, x: 0, y: 7
                            )
                        }
                    }
                    .padding(.horizontal, 28)
                    .padding(.top, 30)
                    .padding(.bottom, 24)
                }
                .frame(height: 370)
            }
        }
    }
}

// ── Physio stretch figure — purple/pink gradient shapes ──
struct PhysioFigure: View {
    var body: some View {
        ZStack {

            // Torso
            RoundedRectangle(cornerRadius: 18)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.52, green: 0.32, blue: 0.92),
                            Color(red: 0.85, green: 0.32, blue: 0.78)
                        ],
                        startPoint: .top, endPoint: .bottom
                    )
                )
                .frame(width: 52, height: 72)
                .offset(x: 0, y: 8)

            // Head
            Circle()
                .fill(Color(red: 0.95, green: 0.80, blue: 0.72))
                .frame(width: 36, height: 36)
                .offset(x: 12, y: -50)

            // Hair
            Ellipse()
                .fill(Color(red: 0.25, green: 0.18, blue: 0.35))
                .frame(width: 32, height: 18)
                .offset(x: 12, y: -62)

            // Raised left arm
            RoundedRectangle(cornerRadius: 8)
                .fill(
                    LinearGradient(
                        colors: [Color(red: 0.95, green: 0.80, blue: 0.72),
                                 Color(red: 0.52, green: 0.32, blue: 0.92)],
                        startPoint: .top, endPoint: .bottom
                    )
                )
                .frame(width: 13, height: 62)
                .rotationEffect(.degrees(-38))
                .offset(x: -34, y: -26)

            // Right arm behind head (stretched back)
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(red: 0.52, green: 0.32, blue: 0.92).opacity(0.75))
                .frame(width: 12, height: 48)
                .rotationEffect(.degrees(28))
                .offset(x: 30, y: -36)

            // Left leg bent forward
            RoundedRectangle(cornerRadius: 10)
                .fill(
                    LinearGradient(
                        colors: [Color(red: 0.52, green: 0.32, blue: 0.92),
                                 Color(red: 0.85, green: 0.32, blue: 0.78)],
                        startPoint: .top, endPoint: .bottom
                    )
                )
                .frame(width: 15, height: 72)
                .rotationEffect(.degrees(48))
                .offset(x: -32, y: 52)

            // Right leg extended back
            RoundedRectangle(cornerRadius: 10)
                .fill(
                    LinearGradient(
                        colors: [Color(red: 0.52, green: 0.32, blue: 0.92),
                                 Color(red: 0.85, green: 0.32, blue: 0.78)],
                        startPoint: .top, endPoint: .bottom
                    )
                )
                .frame(width: 15, height: 76)
                .rotationEffect(.degrees(-32))
                .offset(x: 36, y: 58)
        }
        .offset(y: 8)
    }
}

// ── Feature chip ──
struct FeatureChip: View {
    let icon: String
    let label: String

    var body: some View {
        HStack(spacing: 5) {
            Text(icon).font(.system(size: 12))
            Text(label)
                .font(.system(size: 11, weight: .semibold))
                .foregroundColor(.white)
        }
        .padding(.horizontal, 11)
        .padding(.vertical, 7)
        .background(Color.blue.opacity(0.2))
        .clipShape(Capsule())
    }
}

//// ── Playground entry ──
//PlaygroundPage.current.setLiveView(
//    WelcomeScreen()
//        .frame(width: 390, height: 720)
//)

struct WelcomeScreen_Previews: View {
    @State private var showSelection = false
    var body: some View {
        if showSelection {
            ConditionSelectionScreen(onBack: { showSelection = false })
        } else {
            WelcomeScreen(onStarted: { showSelection = true })
        }
    }
}

#Preview("Full App Flow") {
    WelcomeScreen_Previews()
}
