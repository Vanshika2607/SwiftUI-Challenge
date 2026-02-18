import SwiftUI

struct ConditionSelectionScreen: View {
    let onBack: () -> Void
    
    @State private var selectedCondition: Condition? = nil
    @State private var navigateToPersonalization = false
    
    var body: some View {
        ZStack {
            
            // Soft lavender background
            Color(red: 0.05, green: 0.05, blue: 0.07)
                .ignoresSafeArea()
            
            if navigateToPersonalization, let condition = selectedCondition {
                PersonalizationScreen(condition: condition, onBack: {
                    navigateToPersonalization = false
                    selectedCondition = nil
                })
                .transition(.move(edge: .trailing))
            } else {
                mainView
            }
        }
        .animation(.easeInOut(duration: 0.3), value: navigateToPersonalization)
    }
    
    var mainView: some View {
        VStack(spacing: 0) {
            
            // ── HEADER (FIXED) ──
            VStack(spacing: 0) {
                HStack {
                    Button {
                        onBack()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.blue)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.1))
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 3)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
                .padding(.bottom, 16)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Choose Your")
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(.white)
                    Text("Focus Area")
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(Color.blue)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.bottom, 6)
                
                Text("Select what you need support with")
                    .font(.system(size: 14))
                    .foregroundColor(Color.white.opacity(0.7))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 16)
            }
            .background(Color(red: 0.05, green: 0.05, blue: 0.07))
            
            // ── SCROLLABLE GRID ──
            ScrollView(showsIndicators: false) {
                LazyVGrid(
                    columns: [
                        GridItem(.flexible(), spacing: 14),
                        GridItem(.flexible(), spacing: 14)
                    ],
                    spacing: 14
                ) {
                    ForEach(Condition.allConditions) { condition in
                        ConditionCard(
                            condition: condition,
                            isSelected: selectedCondition?.id == condition.id
                        ) {
                            withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
                                selectedCondition = condition
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation {
                                    navigateToPersonalization = true
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 30)
            }
        }
    }
}

// ── CONDITION MODEL ──
struct Condition: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    let imageName: String
    
    static let allConditions: [Condition] = [
        Condition(
            icon: "💪",
            title: "Muscle Soreness",
            subtitle: "Relief & recovery",
            color: Color(red: 0.92, green: 0.42, blue: 0.38),
            imageName: "figure.strengthtraining.traditional"
        ),
        Condition(
            icon: "🩹",
            title: "Shoulder Pain",
            subtitle: "Tension & mobility",
            color: Color(red: 0.42, green: 0.82, blue: 0.72),
            imageName: "figure.mind.and.body"
        ),
        Condition(
            icon: "🦴",
            title: "Joint Pain",
            subtitle: "Knees, hips & elbows",
            color: Color(red: 0.85, green: 0.32, blue: 0.78),
            imageName: "figure.flexibility"
        ),
        Condition(
            icon: "🦵",
            title: "Mobility Issues",
            subtitle: "Walking & balance",
            color: Color(red: 0.52, green: 0.32, blue: 0.92),
            imageName: "figure.walk"
        ),
        Condition(
            icon: "👁️",
            title: "Visual Aid",
            subtitle: "Spatial awareness",
            color: Color(red: 0.32, green: 0.72, blue: 0.92),
            imageName: "eye.fill"
        ),
        Condition(
            icon: "👂",
            title: "Hearing Aid",
            subtitle: "Balance exercises",
            color: Color(red: 0.92, green: 0.62, blue: 0.32),
            imageName: "ear.fill"
        )
    ]
}

// ── CONDITION CARD ──
struct ConditionCard: View {
    let condition: Condition
    let isSelected: Bool
    let action: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 0) {
                
                // Top minimal section (Dark)
                ZStack {
                    Color.white.opacity(0.05)
                    
                    Image(systemName: condition.imageName)
                        .font(.system(size: 40, weight: .medium))
                        .foregroundColor(Color(red: 0.65, green: 0.45, blue: 0.95))
                        .shadow(color: Color.purple.opacity(0.3), radius: 5, x: 0, y: 2)
                }
                .frame(height: 105)
                .frame(maxWidth: .infinity)
                
                // Bottom white info
                VStack(alignment: .leading, spacing: 5) {
                    HStack(spacing: 6) {
                        Text(condition.icon).font(.system(size: 17))
                        Text(condition.title)
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                    }
                    
                    Text(condition.subtitle)
                        .font(.system(size: 11))
                        .foregroundColor(Color.white.opacity(0.6))
                        .lineLimit(2)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 11)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(red: 0.52, green: 0.32, blue: 0.92).opacity(0.12))
            }
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(isSelected ? Color(red: 0.75, green: 0.32, blue: 0.88) : Color.white.opacity(0.1), lineWidth: 2.5)
            )
            .shadow(
                color: isSelected ? Color(red: 0.52, green: 0.32, blue: 0.92).opacity(0.3) : Color.black.opacity(0.2),
                radius: isSelected ? 12 : 6,
                x: 0,
                y: isSelected ? 4 : 2
            )
            .scaleEffect(isPressed ? 0.97 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed = true }
                .onEnded { _ in isPressed = false }
        )
    }
}

// ── SCREEN 3: PERSONALIZATION ──
struct PersonalizationScreen: View {
    let condition: Condition
    let onBack: () -> Void
    
    @State private var intensityLevel: IntensityLevel = .medium
    @State private var mobilityLevel: MobilityLevel = .medium
    @State private var dailyTime: DailyTime = .fifteen
    @State private var additionalNotes: String = ""
    @State private var showPlan = false
    
    var body: some View {
        ZStack {
            Color(red: 0.05, green: 0.05, blue: 0.07)
                .ignoresSafeArea()
            
            if showPlan {
                ExercisePlanScreen(
                    condition: condition,
                    intensity: intensityLevel,
                    mobility: mobilityLevel,
                    timeAvailable: dailyTime,
                    onBack: { showPlan = false }
                )
                .transition(.move(edge: .trailing))
            } else {
                VStack(spacing: 0) {
                    
                    // ── HEADER (FIXED) ──
                    VStack(spacing: 0) {
                        HStack {
                            Button(action: onBack) {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.blue)
                                    .frame(width: 40, height: 40)
                                    .background(Color.white.opacity(0.1))
                                    .clipShape(Circle())
                                    .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 3)
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 12)
                        .padding(.bottom, 16)
                        
                        // Selected condition
                        HStack(spacing: 12) {
                            ZStack {
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            colors: [Color.blue.opacity(0.25), Color(red: 0.52, green: 0.32, blue: 0.92).opacity(0.25)],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(width: 52, height: 52)
                                Text(condition.icon).font(.system(size: 26))
                            }
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text(condition.title)
                                    .font(.system(size: 17, weight: .bold))
                                    .foregroundColor(.white)
                                Text("Personalize your plan")
                                    .font(.system(size: 13))
                                    .foregroundColor(Color.white.opacity(0.6))
                            }
                            Spacer()
                        }
                        .padding(14)
                        .background(Color(red: 0.12, green: 0.12, blue: 0.14))
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 3)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 16)
                    }
                    .background(Color(red: 0.05, green: 0.05, blue: 0.07))
                    
                    // ── SCROLLABLE FORM ──
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 16) {
                            
                            // Pain/Difficulty Intensity
                            FormSection(title: "Current Pain/Difficulty Level", icon: "⚡") {
                                HStack(spacing: 10) {
                                    ForEach(IntensityLevel.allCases, id: \.self) { level in
                                        IntensityButton(
                                            level: level,
                                            isSelected: intensityLevel == level,
                                            color: Color(red: 0.65, green: 0.45, blue: 0.95)
                                        ) {
                                            intensityLevel = level
                                        }
                                    }
                                }
                            }
                            
                            // Mobility Level
                            FormSection(title: "Current Mobility", icon: "🎯") {
                                HStack(spacing: 10) {
                                    ForEach(MobilityLevel.allCases, id: \.self) { level in
                                        MobilityButton(
                                            level: level,
                                            isSelected: mobilityLevel == level,
                                            color: Color(red: 0.65, green: 0.45, blue: 0.95)
                                        ) {
                                            mobilityLevel = level
                                        }
                                    }
                                }
                            }
                            
                            // Daily Time
                            FormSection(title: "Time Available Daily", icon: "⏰") {
                                VStack(spacing: 8) {
                                    ForEach(DailyTime.allCases, id: \.self) { time in
                                        TimeOption(
                                            time: time,
                                            isSelected: dailyTime == time,
                                            color: Color(red: 0.65, green: 0.45, blue: 0.95)
                                        ) {
                                            dailyTime = time
                                        }
                                    }
                                }
                            }
                            
                            // Additional Notes
                            FormSection(title: "Additional Notes (Optional)", icon: "📝") {
                                ZStack(alignment: .topLeading) {
                                    if additionalNotes.isEmpty {
                                        Text("Any specific concerns or limitations?")
                                            .font(.system(size: 13))
                                            .foregroundColor(Color.white.opacity(0.4))
                                            .padding(.top, 8)
                                            .padding(.leading, 4)
                                    }
                                    TextEditor(text: $additionalNotes)
                                        .font(.system(size: 13))
                                        .frame(height: 70)
                                        .scrollContentBackground(.hidden)
                                        .background(Color.clear)
                                }
                                .padding(8)
                                .background(Color.white.opacity(0.05))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 8)
                        .padding(.bottom, 20)
                        
                        // Generate Plan Button
                        Button {
                            withAnimation { showPlan = true }
                        } label: {
                            HStack(spacing: 10) {
                                Image(systemName: "sparkles")
                                    .font(.system(size: 16, weight: .semibold))
                                Text("Generate My Personalized Plan")
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 17)
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
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(color: Color(red: 0.52, green: 0.32, blue: 0.92).opacity(0.35), radius: 12, x: 0, y: 6)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 30)
                    }
                }
            }
        }
        .animation(.easeInOut(duration: 0.3), value: showPlan)
    }
}

// ── SUPPORTING TYPES ──
enum IntensityLevel: String, CaseIterable {
    case low = "Low"
    case medium = "Medium"
    case intense = "Intense"
}

enum MobilityLevel: String, CaseIterable {
    case low = "Low"
    case medium = "Medium"
    case good = "Good"
}

enum DailyTime: String, CaseIterable {
    case ten = "10 min"
    case fifteen = "15 min"
    case twenty = "20 min"
    case thirty = "30 min"
}

// ── FORM COMPONENTS ──
struct FormSection<Content: View>: View {
    let title: String
    let icon: String
    let content: Content
    
    init(title: String, icon: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.icon = icon
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 6) {
                Text(icon).font(.system(size: 15))
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
            }
            content
        }
        .padding(15)
        .background(Color(red: 0.12, green: 0.12, blue: 0.14)) 
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white.opacity(0.1), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.03), radius: 5, x: 0, y: 2)
    }
}

struct IntensityButton: View {
    let level: IntensityLevel
    let isSelected: Bool
    let color: Color
    let action: () -> Void
    
    var emoji: String {
        switch level {
        case .low: return "🟢"
        case .medium: return "🟡"
        case .intense: return "🔴"
        }
    }
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Text(emoji).font(.system(size: 22))
                Text(level.rawValue)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(isSelected ? .white : Color.white.opacity(0.7))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(isSelected ? color : Color.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? color : Color.clear, lineWidth: 2)
            )
        }
    }
}

struct MobilityButton: View {
    let level: MobilityLevel
    let isSelected: Bool
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(level.rawValue)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(isSelected ? .white : Color.white.opacity(0.7))
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(isSelected ? color : Color.white.opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(isSelected ? color : Color.clear, lineWidth: 2)
                )
        }
    }
}

struct TimeOption: View {
    let time: DailyTime
    let isSelected: Bool
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 18))
                    .foregroundColor(isSelected ? color : Color.white.opacity(0.3))
                Text(time.rawValue)
                    .font(.system(size: 14, weight: isSelected ? .semibold : .medium))
                    .foregroundColor(Color.white.opacity(isSelected ? 1.0 : 0.7))
                Spacer()
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 12)
            .background(isSelected ? color.opacity(0.15) : Color.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}




struct ConditionSelectionScreen_Previews: PreviewProvider {
    static var previews: some View {
        ConditionSelectionScreen(onBack: {})
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("Condition Selection")
    }
}
