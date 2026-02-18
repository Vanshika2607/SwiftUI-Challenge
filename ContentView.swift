import SwiftUI

struct ContentView: View {
    @State private var showSelection = false
    
    var body: some View {
        if showSelection {
            ConditionSelectionScreen(onBack: {
                withAnimation {
                    showSelection = false
                }
            })
            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        } else {
            WelcomeScreen(onStarted: {
                withAnimation {
                    showSelection = true
                }
            })
            .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
        }
    }
}
