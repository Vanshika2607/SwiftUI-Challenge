//
//  SwiftUIView.swift
//  ReAble
//
//  Created by Student on 18/02/26.
//

import SwiftUI


// ── EXERCISE MODEL ──
struct Exercise: Identifiable {
    let id = UUID()
    let name: String
    let targetConditions: [String] // Which conditions this helps
    let difficulty: IntensityLevel // Low, Medium, or Intense
    let duration: Int // in minutes
    let steps: [String]
    let precautions: [String]
    let benefits: String
    let youtubeLink: String
    let equipment: String
}

// ── EXERCISE LIBRARY ──
struct ExerciseLibrary {
    static let allExercises: [Exercise] = [
        
        // ══════ MUSCLE SORENESS EXERCISES ══════
        Exercise(
            name: "Gentle Muscle Stretches",
            targetConditions: ["Muscle Soreness"],
            difficulty: .low,
            duration: 5,
            steps: [
                "Stand or sit in a comfortable position",
                "Slowly stretch the sore muscle group",
                "Hold each stretch for 20-30 seconds",
                "Breathe deeply and relax into the stretch",
                "Never bounce or force the stretch"
            ],
            precautions: [
                "Stop immediately if you feel sharp pain",
                "Do not stretch a severely strained muscle",
                "Warm up with light movement first"
            ],
            benefits: "Reduces muscle tension and improves flexibility",
            youtubeLink: "https://youtube.com/watch?v=g_tea8ZNk5A",
            equipment: "None"
        ),
        
        Exercise(
            name: "Foam Rolling Recovery",
            targetConditions: ["Muscle Soreness"],
            difficulty: .medium,
            duration: 8,
            steps: [
                "Place foam roller under the sore muscle",
                "Use your body weight to apply pressure",
                "Roll slowly back and forth",
                "Pause on tender spots for 20-30 seconds",
                "Avoid rolling directly on joints"
            ],
            precautions: [
                "Avoid if you have severe bruising",
                "Do not roll on lower back",
                "Stop if numbness occurs"
            ],
            benefits: "Releases muscle knots and improves blood flow",
            youtubeLink: "https://youtube.com/watch?v=3OVEd__KmXo",
            equipment: "Foam roller"
        ),
        
        Exercise(
            name: "Child's Pose Recovery",
            targetConditions: ["Muscle Soreness", "Joint Pain"],
            difficulty: .low,
            duration: 4,
            steps: [
                "Kneel on the floor with toes touching",
                "Sit back on your heels and lean forward",
                "Extend arms forward on the floor",
                "Rest your forehead on the ground",
                "Hold for 30-60 seconds while breathing deeply"
            ],
            precautions: [
                "Avoid if you have severe knee pain",
                "Do not force hips lower than comfortable",
                "Stop if you feel sharp pain in the back"
            ],
            benefits: "Gently stretches the back, hips, and thighs",
            youtubeLink: "https://youtube.com/watch?v=eqVMAPM07wM",
            equipment: "Yoga mat or soft surface"
        ),
        
        Exercise(
            name: "Dynamic Leg Swings",
            targetConditions: ["Muscle Soreness", "Mobility Issues"],
            difficulty: .medium,
            duration: 5,
            steps: [
                "Stand tall and hold onto a wall or chair for balance",
                "Swing one leg forward and backward gently",
                "Keep the movement controlled, not a kick",
                "Do 15 swings per leg",
                "Switch to side-to-side swings for 15 reps"
            ],
            precautions: [
                "Keep your torso upright and core engaged",
                "Do not over-extend the range of motion",
                "Ensure support surface is stable"
            ],
            benefits: "Increases blood flow and mobility in the lower body",
            youtubeLink: "https://youtube.com/watch?v=3SStBf68T08",
            equipment: "Wall or sturdy chair"
        ),
        
        // ══════ SHOULDER PAIN EXERCISES ══════
        Exercise(
            name: "Pendulum Shoulder Swings",
            targetConditions: ["Shoulder Pain"],
            difficulty: .low,
            duration: 5,
            steps: [
                "Lean forward and support yourself with one hand",
                "Let the painful arm hang down freely",
                "Gently swing arm in small circles",
                "Make 10 circles clockwise, then 10 counter-clockwise",
                "Gradually increase circle size as comfort allows"
            ],
            precautions: [
                "Do not force movement if it causes sharp pain",
                "Keep movements slow and controlled",
                "Stop if dizziness occurs"
            ],
            benefits: "Reduces stiffness and improves shoulder mobility",
            youtubeLink: "https://youtube.com/watch?v=VCPp1xxx48w",
            equipment: "Table or chair for support"
        ),
        
        Exercise(
            name: "Wall Slides",
            targetConditions: ["Shoulder Pain"],
            difficulty: .medium,
            duration: 6,
            steps: [
                "Stand with back flat against a wall",
                "Place arms against wall at 90-degree angle",
                "Slowly slide arms up the wall",
                "Go as high as comfortable without pain",
                "Slide back down slowly",
                "Repeat 10-15 times"
            ],
            precautions: [
                "Keep lower back pressed to wall",
                "Stop if shoulder pain increases",
                "Do not arch your back"
            ],
            benefits: "Strengthens shoulder stabilizers and improves posture",
            youtubeLink: "https://youtube.com/watch?v=KmzFsL6P2Y4",
            equipment: "Wall"
        ),
        
        Exercise(
            name: "Resistance Band External Rotation",
            targetConditions: ["Shoulder Pain"],
            difficulty: .intense,
            duration: 8,
            steps: [
                "Attach resistance band at elbow height",
                "Stand sideways to anchor point",
                "Hold band with arm bent at 90 degrees",
                "Rotate forearm outward against resistance",
                "Return slowly to starting position",
                "Do 12-15 repetitions per side"
            ],
            precautions: [
                "Keep elbow tucked to your side",
                "Use light resistance to start",
                "Stop if sharp pain occurs"
            ],
            benefits: "Strengthens rotator cuff muscles",
            youtubeLink: "https://youtube.com/watch?v=5JYhR3KkFco",
            equipment: "Resistance band"
        ),
        
        Exercise(
            name: "Scapular Squeezes",
            targetConditions: ["Shoulder Pain"],
            difficulty: .low,
            duration: 4,
            steps: [
                "Sit or stand with a tall posture",
                "Squeeze shoulder blades together and down",
                "Imagine trying to hold a pencil between them",
                "Hold for 5 seconds, then relax",
                "Repeat 12-15 times"
            ],
            precautions: [
                "Do not shrug your shoulders upward",
                "Keep neck relaxed throughout",
                "Stop if you feel neck tension"
            ],
            benefits: "Improves posture and shoulder blade stability",
            youtubeLink: "https://youtube.com/watch?v=MInX9W2TOnQ",
            equipment: "None"
        ),
        
        // ══════ JOINT PAIN EXERCISES ══════
        Exercise(
            name: "Seated Knee Extensions",
            targetConditions: ["Joint Pain"],
            difficulty: .low,
            duration: 5,
            steps: [
                "Sit upright in a sturdy chair",
                "Slowly straighten one leg in front of you",
                "Hold for 5 seconds at the top",
                "Lower slowly back down",
                "Repeat 10 times per leg"
            ],
            precautions: [
                "Do not lock knee joint at full extension",
                "Stop if knee pain increases",
                "Keep movements slow and controlled"
            ],
            benefits: "Strengthens quadriceps without stressing joints",
            youtubeLink: "https://youtube.com/watch?v=s2vHBB-2cjE",
            equipment: "Chair"
        ),
        
        Exercise(
            name: "Ankle Circles",
            targetConditions: ["Joint Pain"],
            difficulty: .low,
            duration: 4,
            steps: [
                "Sit comfortably with one leg extended",
                "Rotate ankle slowly in circles",
                "Make 10 circles clockwise",
                "Then 10 circles counter-clockwise",
                "Repeat with other ankle"
            ],
            precautions: [
                "Move within pain-free range only",
                "Stop if swelling increases",
                "Keep movements gentle"
            ],
            benefits: "Improves ankle mobility and reduces stiffness",
            youtubeLink: "https://youtube.com/watch?v=g8AGdp1bDdQ",
            equipment: "None"
        ),
        
        Exercise(
            name: "Hip Bridges",
            targetConditions: ["Joint Pain"],
            difficulty: .medium,
            duration: 6,
            steps: [
                "Lie on back with knees bent, feet flat",
                "Tighten core and glutes",
                "Lift hips off floor until body forms straight line",
                "Hold for 5 seconds",
                "Lower slowly and repeat 12-15 times"
            ],
            precautions: [
                "Do not arch lower back excessively",
                "Stop if hip or knee pain worsens",
                "Keep core engaged throughout"
            ],
            benefits: "Strengthens hips and glutes while protecting joints",
            youtubeLink: "https://youtube.com/watch?v=wPM8icPu6H8",
            equipment: "Yoga mat"
        ),
        
        Exercise(
            name: "Quad Sets",
            targetConditions: ["Joint Pain"],
            difficulty: .low,
            duration: 5,
            steps: [
                "Sit with legs extended on a flat surface",
                "Tighten the muscle on top of your thigh",
                "Push the back of your knee down into the floor",
                "Hold the contraction for 5-10 seconds",
                "Repeat 15 times per leg"
            ],
            precautions: [
                "Do not hold your breath while contracting",
                "Keep the movement isometric (no joint movement)",
                "Stop if you feel sharp knee pain"
            ],
            benefits: "Strengthens knee stabilizers without joint impact",
            youtubeLink: "https://youtube.com/watch?v=B8o0m26p71A",
            equipment: "Flat surface or mat"
        ),
        
        // ══════ MOBILITY DISABILITY EXERCISES ══════
        Exercise(
            name: "Seated Marching",
            targetConditions: ["Mobility Disability"],
            difficulty: .low,
            duration: 5,
            steps: [
                "Sit upright in a sturdy chair",
                "Lift right knee up towards chest",
                "Lower it back down",
                "Lift left knee up",
                "Continue alternating for 2-3 minutes",
                "Keep back straight throughout"
            ],
            precautions: [
                "Hold armrests if balance is poor",
                "Stop if you feel dizzy",
                "Start slowly and increase pace gradually"
            ],
            benefits: "Improves hip mobility and circulation",
            youtubeLink: "https://youtube.com/watch?v=h_9vb9g2TXk",
            equipment: "Sturdy chair"
        ),
        
        Exercise(
            name: "Sit-to-Stand Practice",
            targetConditions: ["Mobility Disability"],
            difficulty: .medium,
            duration: 6,
            steps: [
                "Sit on edge of sturdy chair",
                "Feet flat on floor, shoulder-width apart",
                "Lean forward slightly",
                "Push through heels to stand up",
                "Slowly lower back down to seated",
                "Repeat 8-12 times"
            ],
            precautions: [
                "Use armrests for support if needed",
                "Do not stand up too quickly",
                "Stop if knee or hip pain occurs"
            ],
            benefits: "Builds leg strength essential for walking and independence",
            youtubeLink: "https://youtube.com/watch?v=t-1r_YCAEqE",
            equipment: "Sturdy chair"
        ),
        
        Exercise(
            name: "Balance Training with Support",
            targetConditions: ["Mobility Disability", "Visual Aid", "Hearing Aid"],
            difficulty: .medium,
            duration: 7,
            steps: [
                "Stand next to a wall or sturdy surface",
                "Place fingertips lightly on support",
                "Shift weight to one leg",
                "Lift other foot slightly off ground",
                "Hold for 10-20 seconds",
                "Repeat on other leg",
                "Do 3-5 repetitions per side"
            ],
            precautions: [
                "Always practice near a stable support",
                "Do not attempt without support initially",
                "Stop if you feel unsteady"
            ],
            benefits: "Improves balance and prevents falls",
            youtubeLink: "https://youtube.com/watch?v=VsK1JJIWw7U",
            equipment: "Wall or sturdy furniture"
        ),
        
        Exercise(
            name: "Side-Stepping with Support",
            targetConditions: ["Mobility Issues"],
            difficulty: .medium,
            duration: 6,
            steps: [
                "Stand facing a wall or long counter",
                "Place hands lightly on the surface",
                "Take 10 steps to the right, then 10 to the left",
                "Keep steps small and controlled",
                "Maintain an upright posture"
            ],
            precautions: [
                "Do not cross your feet",
                "Ensure the path is clear of obstacles",
                "Stop if you feel unsteady"
            ],
            benefits: "Improves lateral stability and hip strength",
            youtubeLink: "https://youtube.com/watch?v=Tq_m2cI670c",
            equipment: "Wall or counter"
        ),
        
        // ══════ VISUAL AID EXERCISES ══════
        Exercise(
            name: "Guided Walking with Tactile Cues",
            targetConditions: ["Visual Aid"],
            difficulty: .low,
            duration: 8,
            steps: [
                "Walk along a wall, trailing one hand lightly",
                "Count steps aloud to build spatial awareness",
                "Practice in a familiar safe space",
                "Walk forward 10 steps, then return",
                "Increase distance as confidence builds"
            ],
            precautions: [
                "Clear path of obstacles first",
                "Have a helper nearby initially",
                "Use mobility aid if prescribed"
            ],
            benefits: "Builds confidence in navigation and spatial orientation",
            youtubeLink: "https://youtube.com/watch?v=L8qPFh-CAnA",
            equipment: "Clear walking path"
        ),
        
        Exercise(
            name: "Seated Balance with Auditory Cues",
            targetConditions: ["Visual Aid"],
            difficulty: .low,
            duration: 5,
            steps: [
                "Sit upright on edge of chair",
                "Focus on sounds around you",
                "Lift feet slightly off ground",
                "Balance using core muscles",
                "Hold for 10-20 seconds",
                "Use sound to orient yourself"
            ],
            precautions: [
                "Ensure chair is stable and won't slide",
                "Keep hands ready to catch yourself",
                "Practice in quiet environment first"
            ],
            benefits: "Improves balance without relying on vision",
            youtubeLink: "https://youtube.com/watch?v=aUdY-x6KM3Q",
            equipment: "Sturdy chair"
        ),
        
        Exercise(
            name: "Spatial Orientation Reach",
            targetConditions: ["Visual Aid"],
            difficulty: .low,
            duration: 5,
            steps: [
                "Sit comfortably in a chair",
                "A helper places an object in front, left, or right",
                "Reach out and touch the object slowly",
                "Focus on the feeling of the distance",
                "Repeat 10-15 times for different positions"
            ],
            precautions: [
                "Ensure object is not sharp",
                "Maintain stable seating throughout",
                "Start with small distances"
            ],
            benefits: "Develops reach accuracy and spatial awareness",
            youtubeLink: "https://youtube.com/watch?v=oXWp561c96M",
            equipment: "Chair and various objects"
        ),
        
        // ══════ HEARING AID EXERCISES ══════
        Exercise(
            name: "Visual Balance Training",
            targetConditions: ["Hearing Aid"],
            difficulty: .low,
            duration: 6,
            steps: [
                "Stand with feet together near support",
                "Focus eyes on a fixed point ahead",
                "Shift weight side to side slowly",
                "Use visual focus to maintain balance",
                "Hold each position for 10 seconds"
            ],
            precautions: [
                "Practice near wall or sturdy furniture",
                "Do not close eyes",
                "Stop if dizziness occurs"
            ],
            benefits: "Compensates for reduced vestibular input from hearing challenges",
            youtubeLink: "https://youtube.com/watch?v=Y6tKq1BA8qE",
            equipment: "Wall for support"
        ),
        
        Exercise(
            name: "Head Turn Coordination",
            targetConditions: ["Hearing Aid"],
            difficulty: .medium,
            duration: 5,
            steps: [
                "Sit upright in chair",
                "Keep eyes focused on fixed point",
                "Slowly turn head left while eyes stay forward",
                "Return to center",
                "Turn head right while eyes stay forward",
                "Repeat 10 times each direction"
            ],
            precautions: [
                "Move slowly to avoid dizziness",
                "Stop if nausea occurs",
                "Practice when not fatigued"
            ],
            benefits: "Improves vestibular function and reduces balance issues",
            youtubeLink: "https://youtube.com/watch?v=m2yDY8R69ls",
            equipment: "Chair"
        ),
        
        Exercise(
            name: "Tandem Standing",
            targetConditions: ["Hearing Aid", "Mobility Issues"],
            difficulty: .medium,
            duration: 5,
            steps: [
                "Stand near a wall for safety",
                "Place one foot directly in front of the other (heel to toe)",
                "Focus on a fixed point ahead",
                "Try to balance for 30 seconds",
                "Switch feet and repeat 3 times"
            ],
            precautions: [
                "Always have a wall or chair within reach",
                "Stop immediately if you feel dizzy",
                "Do not attempt without support if unsteady"
            ],
            benefits: "Challenges and improves the balance system",
            youtubeLink: "https://youtube.com/watch?v=F_fP97L8_d0",
            equipment: "Wall or chair for safety"
        ),
        
        // ══════ GENERAL/COMBINED EXERCISES ══════
        Exercise(
            name: "Deep Breathing for Relaxation",
            targetConditions: ["Muscle Soreness", "Shoulder Pain", "Joint Pain", "Mobility Disability", "Visual Aid", "Hearing Aid"],
            difficulty: .low,
            duration: 4,
            steps: [
                "Sit or lie in comfortable position",
                "Place one hand on chest, one on belly",
                "Breathe in slowly through nose for 4 counts",
                "Feel belly rise, chest stays relatively still",
                "Exhale slowly through mouth for 6 counts",
                "Repeat for 3-5 minutes"
            ],
            precautions: [
                "Stop if you feel lightheaded",
                "Do not force breath",
                "Breathe naturally, not deeply"
            ],
            benefits: "Reduces tension, pain perception, and anxiety",
            youtubeLink: "https://youtube.com/watch?v=odADwWzHR24",
            equipment: "None"
        )
    ]
    
    // ── SMART PLAN GENERATOR ──
    static func generatePlan(
        condition: Condition,
        intensity: IntensityLevel,
        mobility: MobilityLevel,
        timeAvailable: DailyTime,
        excludedIds: Set<UUID> = []
    ) -> [Exercise] {
        
        // Get target time in minutes
        let targetMinutes: Int
        switch timeAvailable {
        case .ten: targetMinutes = 10
        case .fifteen: targetMinutes = 15
        case .twenty: targetMinutes = 20
        case .thirty: targetMinutes = 30
        }
        
        // Filter exercises by condition and excluded list
        var filteredExercises = allExercises.filter { exercise in
            exercise.targetConditions.contains(condition.title) && !excludedIds.contains(exercise.id)
        }
        
        // If low mobility, prefer low difficulty exercises
        if mobility == .low {
            filteredExercises = filteredExercises.filter { $0.difficulty == .low }
        }
        
        // Filter by intensity level
        filteredExercises = filteredExercises.filter { exercise in
            switch intensity {
            case .low:
                return exercise.difficulty == .low
            case .medium:
                return exercise.difficulty == .low || exercise.difficulty == .medium
            case .intense:
                return true // All exercises allowed
            }
        }
        
        // Sort by difficulty (easiest first)
        filteredExercises.sort { $0.difficulty.rawValue < $1.difficulty.rawValue }
        
        // Select exercises to fit time
        var selectedExercises: [Exercise] = []
        var currentTime = 0
        
        for exercise in filteredExercises {
            if currentTime + exercise.duration <= targetMinutes {
                selectedExercises.append(exercise)
                currentTime += exercise.duration
            }
            if currentTime >= targetMinutes - 2 { // Within 2 minutes of target
                break
            }
        }
        
        // Always include breathing exercise if time allows
        if let breathingExercise = allExercises.first(where: { $0.name == "Deep Breathing for Relaxation" }),
           currentTime + breathingExercise.duration <= targetMinutes,
           !selectedExercises.contains(where: { $0.name == breathingExercise.name }) {
            selectedExercises.append(breathingExercise)
        }
        
        return selectedExercises
    }
}

// ── SCREEN 4: EXERCISE PLAN ──
struct ExercisePlanScreen: View {
    let condition: Condition
    let intensity: IntensityLevel
    let mobility: MobilityLevel
    let timeAvailable: DailyTime
    let onBack: () -> Void
    
    @State private var exercises: [Exercise] = []
    @State private var expandedExercise: UUID? = nil
    
    // Feedback State
    @State private var feedbackStatus: FeedbackStatus = .none
    @State private var showDashboard = false
    @State private var adjustedIntensity: IntensityLevel? = nil
    @State private var adjustedMobility: MobilityLevel? = nil
    @State private var excludedExercises: Set<UUID> = []
    
    enum FeedbackStatus {
        case none, satisfied, adjusted
    }
    
    var totalMinutes: Int {
        exercises.reduce(0) { $0 + $1.duration }
    }
    
    var body: some View {
        ZStack {
            Color(red: 0.05, green: 0.05, blue: 0.07)
                .ignoresSafeArea()
            
            if showDashboard {
                ProgressDashboard(
                    condition: condition,
                    exerciseCount: exercises.count,
                    onBack: { withAnimation { showDashboard = false } }
                )
                .transition(.move(edge: .trailing))
            } else {
                VStack(spacing: 0) {
                
                // ── FIXED HEADER ──
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
                    .padding(.bottom, 12)
                    
                    // Plan summary card
                    VStack(spacing: 10) {
                        Text("🎯")
                            .font(.system(size: 50))
                            .shadow(color: Color.purple.opacity(0.3), radius: 10, x: 0, y: 5)
                        
                        Text("Your Personalized Plan")
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        
                        HStack(spacing: 12) {
                            PlanBadge(icon: "💪", label: (adjustedIntensity ?? intensity).rawValue, color: Color(red: 0.65, green: 0.45, blue: 0.95))
                            PlanBadge(icon: "⏱", label: "\(totalMinutes) min", color: Color(red: 0.65, green: 0.45, blue: 0.95))
                        }
                        
                        if feedbackStatus == .adjusted {
                            HStack(spacing: 6) {
                                Image(systemName: "sparkles")
                                Text("Plan Adjusted for You")
                            }
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(Color(red: 0.42, green: 0.82, blue: 0.72))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Color(red: 0.42, green: 0.82, blue: 0.72).opacity(0.1))
                            .clipShape(Capsule())
                        }
                    }
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.12, green: 0.12, blue: 0.14))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .black.opacity(0.08), radius: 10, x: 0, y: 4)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 16)
                }
                .background(Color(red: 0.05, green: 0.05, blue: 0.07))
                
                // ── SCROLLABLE EXERCISES ──
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 12) {
                        ForEach(Array(exercises.enumerated()), id: \.element.id) { index, exercise in
                            ExerciseCard(
                                exercise: exercise,
                                number: index + 1,
                                isExpanded: expandedExercise == exercise.id,
                                accentColor: condition.color
                            ) {
                                withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                                    expandedExercise = expandedExercise == exercise.id ? nil : exercise.id
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    
                    // ── FEEDBACK SECTION ──
                    VStack(spacing: 20) {
                        Divider()
                            .background(Color.white.opacity(0.1))
                            .padding(.vertical, 10)
                        
                        if feedbackStatus == .satisfied {
                            VStack(spacing: 12) {
                                Text("🌟")
                                    .font(.system(size: 40))
                                Text("Great to hear it's helping!")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.white)
                                Text("Consistency is key to recovery. Keep going!")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.white.opacity(0.6))
                                    .multilineTextAlignment(.center)
                            }
                            .padding(20)
                            .background(Color.white.opacity(0.05))
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                        } else {
                            VStack(alignment: .leading, spacing: 16) {
                                Text("How is this plan working?")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.white)
                                
                                HStack(spacing: 10) {
                                    FeedbackButton(title: "Helping Me", icon: "✅", color: .blue) {
                                        withAnimation { feedbackStatus = .satisfied }
                                    }
                                    
                                    FeedbackButton(title: "Too Difficult", icon: "⚖️", color: .orange) {
                                        adjustPlan(type: .easier)
                                    }
                                    
                                    FeedbackButton(title: "Not Working", icon: "🔄", color: .purple) {
                                        adjustPlan(type: .different)
                                    }
                                }
                            }
                        }
                        
                        // Dashboard Button
                        if feedbackStatus != .none {
                            Button {
                                withAnimation { showDashboard = true }
                            } label: {
                                HStack {
                                    Image(systemName: "chart.pie.fill")
                                    Text("View My Progress Dashboard")
                                }
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(Color.white.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                                )
                            }
                            .padding(.top, 10)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                }
            }
        }
    }
        .onAppear {
            refreshPlan()
        }
    }
    
    private func refreshPlan() {
        exercises = ExerciseLibrary.generatePlan(
            condition: condition,
            intensity: adjustedIntensity ?? intensity,
            mobility: adjustedMobility ?? mobility,
            timeAvailable: timeAvailable,
            excludedIds: excludedExercises
        )
    }
    
    enum AdjustmentType {
        case easier, different
    }
    
    private func adjustPlan(type: AdjustmentType) {
        withAnimation {
            switch type {
            case .easier:
                if (adjustedIntensity ?? intensity) == .intense {
                    adjustedIntensity = .medium
                } else if (adjustedIntensity ?? intensity) == .medium {
                    adjustedIntensity = .low
                } else if (adjustedMobility ?? mobility) == .good {
                    adjustedMobility = .medium
                } else if (adjustedMobility ?? mobility) == .medium {
                    adjustedMobility = .low
                }
            case .different:
                excludedExercises.formUnion(exercises.map { $0.id })
            }
            
            refreshPlan()
            feedbackStatus = .adjusted
        }
    }
}
struct FeedbackButton: View {
    let title: String
    let icon: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Text(icon).font(.system(size: 20))
                Text(title)
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Color.white.opacity(0.05))
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(color.opacity(0.3), lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
    }
}

struct PlanBadge: View {
    let icon: String
    let label: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 4) {
            Text(icon).font(.system(size: 14))
            Text(label)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(color)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(color.opacity(0.12))
        .clipShape(Capsule())
    }
}

struct ExerciseCard: View {
    let exercise: Exercise
    let number: Int
    let isExpanded: Bool
    let accentColor: Color
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 0) {
                
                // Header
                HStack(spacing: 12) {
                    // Number badge
                    Text("\(number)")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 32, height: 32)
                        .background(Color(red: 0.65, green: 0.45, blue: 0.95))
                        .clipShape(Circle())
                        .shadow(color: Color.purple.opacity(0.3), radius: 4, x: 0, y: 2)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        Text(exercise.name)
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        
                        HStack(spacing: 8) {
                            Label("\(exercise.duration) min", systemImage: "clock.fill")
                            Label(exercise.equipment, systemImage: "wrench.fill")
                            
                            if !exercise.youtubeLink.isEmpty {
                                HStack(spacing: 4) {
                                    Image(systemName: "video.fill")
                                    Text("Video")
                                }
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(Color(red: 0.65, green: 0.45, blue: 0.95))
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Color(red: 0.65, green: 0.45, blue: 0.95).opacity(0.1))
                                .clipShape(Capsule())
                            }
                        }
                        .font(.system(size: 11))
                        .foregroundColor(Color.white.opacity(0.6))
                    }
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color(red: 0.65, green: 0.45, blue: 0.95))
                }
                .padding(14)
                
                if isExpanded {
                    Divider()
                        .padding(.horizontal, 14)
                    
                    VStack(alignment: .leading, spacing: 14) {
                        
                        // Benefits
                        VStack(alignment: .leading, spacing: 6) {
                            Text("💡 Benefits")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                            Text(exercise.benefits)
                                .font(.system(size: 12))
                                .foregroundColor(Color.white.opacity(0.7))
                                .lineSpacing(3)
                        }
                        
                        // Steps
                        VStack(alignment: .leading, spacing: 8) {
                            Text("📝 How to Perform")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                            
                            ForEach(Array(exercise.steps.enumerated()), id: \.offset) { index, step in
                                HStack(alignment: .top, spacing: 8) {
                                    Text("\(index + 1).")
                                        .font(.system(size: 11, weight: .bold))
                                        .foregroundColor(Color(red: 0.65, green: 0.45, blue: 0.95))
                                        .frame(width: 20, alignment: .leading)
                                    Text(step)
                                        .font(.system(size: 12))
                                        .foregroundColor(Color.white.opacity(0.8))
                                        .lineSpacing(3)
                                }
                            }
                        }
                        
                        // Precautions
                        VStack(alignment: .leading, spacing: 6) {
                            Text("⚠️ Safety Precautions")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(Color(red: 0.92, green: 0.42, blue: 0.38))
                            
                            ForEach(exercise.precautions, id: \.self) { precaution in
                                HStack(alignment: .top, spacing: 6) {
                                    Text("•")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(Color(red: 0.92, green: 0.42, blue: 0.38))
                                    Text(precaution)
                                        .font(.system(size: 11))
                                        .foregroundColor(Color.white.opacity(0.6))
                                        .lineSpacing(3)
                                }
                            }
                        }
                        .padding(10)
                        .background(Color.red.opacity(0.08))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        // YouTube Link Section
                        if let url = URL(string: exercise.youtubeLink) {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("🎥 Reference Video")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white)
                                
                                Link(destination: url) {
                                    HStack(spacing: 8) {
                                        Image(systemName: "play.circle.fill")
                                            .font(.system(size: 18))
                                        Text("Watch Video Tutorial")
                                            .font(.system(size: 13, weight: .semibold))
                                        Spacer()
                                        Image(systemName: "arrow.up.right")
                                            .font(.system(size: 11))
                                    }
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 12)
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
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .shadow(color: Color.purple.opacity(0.3), radius: 8, x: 0, y: 4)
                                }
                            }
                            .padding(.top, 4)
                        }
                    }
                    .padding(14)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
        .background(Color(red: 0.12, green: 0.12, blue: 0.14))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 3)
    }
}

#Preview {
    ExercisePlanScreen(
        condition: Condition.allConditions[0],
        intensity: .medium,
        mobility: .medium,
        timeAvailable: .fifteen,
        onBack: {}
    )
}
