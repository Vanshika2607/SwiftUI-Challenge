import SwiftUI
import Charts

struct ProgressDashboard: View {
    let condition: Condition
    let exerciseCount: Int
    let onBack: () -> Void
    
    // Simulated Data
    let dailyFrequency = 3
    let durationDays = 14
    let completionRate: Double = 0.75
    let effectivenessRate: Double = 0.85
    
    var body: some View {
        ZStack {
            // Dark Background
            Color(red: 0.05, green: 0.05, blue: 0.07)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                headerView
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        // 1. Plan Summary Card
                        planSummaryCard
                        
                        // 2. Visual Progress Section
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Visual Analytics")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                            
                            HStack(spacing: 16) {
                                ChartCard(title: "Plan Completion", percentage: completionRate, icon: "checkmark.circle.fill", colors: [.blue, Color(red: 0.52, green: 0.32, blue: 0.92)])
                                ChartCard(title: "Relief Rate", percentage: effectivenessRate, icon: "heart.fill", colors: [Color(red: 0.65, green: 0.45, blue: 0.95), Color(red: 0.85, green: 0.32, blue: 0.78)])
                            }
                            .padding(.horizontal, 20)
                        }
                        
                        // 3. Recovery Timeline (Flowchart Style)
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Recovery Pathway")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                            
                            TimelineView(condition: condition)
                                .padding(.horizontal, 20)
                        }
                    }
                    .padding(.vertical, 20)
                }
            }
        }
    }
    
    var headerView: some View {
        HStack {
            Button(action: onBack) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.blue)
                    .frame(width: 40, height: 40)
                    .background(Color.white.opacity(0.1))
                    .clipShape(Circle())
            }
            
            Spacer()
            
            Text("Progress Dashboard")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
            
            Spacer()
            
            // Hidden spacer to balance header
            Color.clear.frame(width: 40, height: 40)
        }
        .padding(.horizontal, 20)
        .padding(.top, 12)
        .padding(.bottom, 16)
        .background(Color(red: 0.05, green: 0.05, blue: 0.07))
    }
    
    var planSummaryCard: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Prescribed Plan")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color.white.opacity(0.6))
                    Text(condition.title)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                }
                Spacer()
                Text(condition.icon)
                    .font(.system(size: 40))
            }
            
            Divider().background(Color.white.opacity(0.1))
            
            HStack(spacing: 0) {
                SummaryItem(label: "Frequency", value: "\(dailyFrequency)x daily", icon: "repeat")
                Spacer()
                SummaryItem(label: "Duration", value: "\(durationDays) Days", icon: "calendar")
                Spacer()
                SummaryItem(label: "Exercises", value: "\(exerciseCount) Total", icon: "figure.strengthtraining.functional")
            }
        }
        .padding(24)
        .background(Color(red: 0.12, green: 0.12, blue: 0.14))
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.white.opacity(0.05), lineWidth: 1)
        )
        .padding(.horizontal, 20)
    }
}

struct SummaryItem: View {
    let label: String
    let value: String
    let icon: String
    
    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(Color(red: 0.65, green: 0.45, blue: 0.95))
            Text(value)
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(.white)
            Text(label)
                .font(.system(size: 10))
                .foregroundColor(Color.white.opacity(0.5))
        }
    }
}

struct ChartCard: View {
    let title: String
    let percentage: Double
    let icon: String
    let colors: [Color]
    
    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.05), lineWidth: 8)
                
                Circle()
                    .trim(from: 0, to: percentage)
                    .stroke(
                        AngularGradient(colors: colors, center: .center),
                        style: StrokeStyle(lineWidth: 8, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                
                VStack(spacing: 2) {
                    Text("\(Int(percentage * 100))%")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                    Image(systemName: icon)
                        .font(.system(size: 10))
                        .foregroundColor(colors[0])
                }
            }
            .frame(width: 80, height: 80)
            
            Text(title)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(Color.white.opacity(0.8))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(Color(red: 0.12, green: 0.12, blue: 0.14))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct TimelineView: View {
    let condition: Condition
    
    let path = [
        ("Assessment", "Condition identified", "checkmark.circle.fill", true),
        ("Prescription", "Personalized plan generated", "doc.text.fill", true),
        ("Execution", "Active exercise phase", "figure.walk", true),
        ("Adjustment", "Plan refinement", "sparkles", false),
        ("Recovery", "Full functionality target", "star.fill", false)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<path.count, id: \.self) { index in
                HStack(alignment: .top, spacing: 20) {
                    VStack(spacing: 0) {
                        ZStack {
                            Circle()
                                .fill(path[index].3 ? Color(red: 0.65, green: 0.45, blue: 0.95) : Color.white.opacity(0.1))
                                .frame(width: 32, height: 32)
                            
                            Image(systemName: path[index].2)
                                .font(.system(size: 14))
                                .foregroundColor(path[index].3 ? .white : .white.opacity(0.3))
                        }
                        
                        if index < path.count - 1 {
                            Rectangle()
                                .fill(path[index].3 ? Color(red: 0.65, green: 0.45, blue: 0.95).opacity(0.5) : Color.white.opacity(0.05))
                                .frame(width: 2, height: 40)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(path[index].0)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(path[index].3 ? .white : .white.opacity(0.4))
                        Text(path[index].1)
                            .font(.system(size: 13))
                            .foregroundColor(path[index].3 ? Color.white.opacity(0.6) : Color.white.opacity(0.2))
                    }
                    .padding(.top, 4)
                    
                    Spacer()
                }
            }
        }
        .padding(24)
        .background(Color(red: 0.12, green: 0.12, blue: 0.14))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    ProgressDashboard(condition: Condition.allConditions[0], exerciseCount: 4, onBack: {})
}
