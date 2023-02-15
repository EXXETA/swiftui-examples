//
// From Mobile@Exxeta by Laura Siewert
// https://medium.com/@mobile_44538
//

import SwiftUI

struct ContentView: View {
    // show either the card or the carddetail
    @State private var isShowingDetail = false
    // Reflects isShowingDetail value but after appearance of view
    @State private var isAppeared = false
    // control if you can interact with the card
    @State private var isAnimating = false

    @Namespace var animation
    
    // Check if animation is on going to disable user interaction
    private func checkOnGoingAnimation(newValue: Bool) {
        if newValue {
            // Disable user interaction while animation
            isAnimating = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                isAnimating = false
            }
        } else {
            // Disable user interaction while animation
            isAnimating = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                isAnimating = false
            }
        }
    }
    
    var body: some View {
        ZStack {
            if isShowingDetail {
                CardDetail(
                    isShowingDetail: $isShowingDetail,
                    isAppeared: $isAppeared,
                    animation: animation
                )
                .transition(.scale(scale: 1))
                .disabled(isAnimating)
            } else {
                Card(
                    isShowingDetail: $isShowingDetail,
                    isAppeared: $isAppeared,
                    animation: animation
                )
                .transition(.scale(scale: 1))
                .disabled(isAnimating)
            }
        }
        .onChange(of: isShowingDetail) { checkOnGoingAnimation(newValue: $0)}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
