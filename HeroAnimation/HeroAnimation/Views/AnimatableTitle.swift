//
// From Mobile@Exxeta by Laura Siewert
// https://medium.com/@mobile_44538
//

import SwiftUI

struct AnimatableTitle: View {
    let isAppeared: Bool
    
    var body: some View {
        Text("Learning: Do a\nSwiftUI tutorial")
            .animatableSystemFont(size: isAppeared ? 32 : 16, weight: .bold)
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity, alignment: .leading)
            .lineLimit(2, reservesSpace: true)
    }
}
