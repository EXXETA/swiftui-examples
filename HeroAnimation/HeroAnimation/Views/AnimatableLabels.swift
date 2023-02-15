//
// From Mobile@Exxeta by Laura Siewert
// https://medium.com/@mobile_44538
//

import SwiftUI

struct AnimatableLabels: View {
    let isAppeared: Bool
    let text: String
    
    var body: some View {
        VStack {
            Text(text)
                .animatableSystemFont(size: isAppeared ? 16 : 12)
                .foregroundColor(.white)
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: isAppeared ? 12 : 8))
                .fixedSize()
        }
    }
}
