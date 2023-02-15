//
// From Mobile@Exxeta by Laura Siewert
// https://medium.com/@mobile_44538
//

import SwiftUI

struct CloseButton: View {
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        Image(systemName: "xmark")
            .font(.system(size: Dimens.unit16))
            .frame(width: Dimens.closeButtonSize, height: Dimens.closeButtonSize)
            .foregroundColor(.black)
            .background(.white)
            .clipShape(Circle())
            .onTapGesture {
                withAnimation(.hero) {
                    isShowingDetail = false
                }
            }
    }
}
