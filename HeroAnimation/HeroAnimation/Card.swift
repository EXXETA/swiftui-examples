//
// From Mobile@Exxeta by Laura Siewert
// https://medium.com/@mobile_44538
//

import SwiftUI

struct Card: View {
    // MARK: - Properties
    @Binding var isShowingDetail: Bool
    @Binding var isAppeared: Bool
    let animation: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // MARK: - Header
            VStack(spacing: 0) {
                Image("header")
                    .resizable()
                    .matchedGeometryEffect(id: AnimationId.imageId, in: animation, anchor: .top)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: Dimens.cardImageHeight, alignment: .top)
                Spacer()
                    .frame(height: Dimens.cardForegroundHeight)
            }
            .frame(width: Dimens.cardWidth, height: Dimens.cardHeight)
            .background(
                Color.black
                    .cornerRadius(Dimens.unit24)
                    .matchedGeometryEffect(id: AnimationId.imageBackgroundId, in: animation)
            )
            // MARK: - Content
            VStack(alignment: .leading, spacing: 0) {
                AnimatableTitle(isAppeared: isAppeared)
                    .matchedGeometryEffect(id: AnimationId.titleId, in: animation, anchor: .center)
                    .padding(.bottom, Dimens.unit6)
                HStack(spacing: Dimens.unit12) {
                    AnimatableLabels(isAppeared: isAppeared, text: Texts.points)
                        .matchedGeometryEffect(id: AnimationId.label1Id, in: animation)
                    AnimatableLabels(isAppeared: isAppeared, text: Texts.category)
                        .matchedGeometryEffect(id: AnimationId.label2Id, in: animation)
                }
            }
            .padding(Dimens.unit16)
            .frame(width: Dimens.cardWidth, height: Dimens.cardForegroundHeight)
            .background(
                Color.white
                    .cornerRadius(Dimens.unit24, corners: [.topLeft, .topRight])
                    .matchedGeometryEffect(id: AnimationId.textBackgroundId, in: animation)
            )
        }
        .onAppear {
            withAnimation(.linear) {
                isAppeared = isShowingDetail
            }
        }
        .mask {
            RoundedRectangle(cornerRadius: Dimens.unit24)
                .matchedGeometryEffect(id: AnimationId.backgroundShapeId, in: animation)
        }
        .shadow(radius: Dimens.unit16)
        .onTapGesture {
            withAnimation(.hero) {
                isShowingDetail = true
            }
        }
    }
}

struct Card_Previews: PreviewProvider {
    struct TestCard: View {
        @Namespace var animation
        var body: some View {
            Card(
                isShowingDetail: .constant(false),
                isAppeared: .constant(false),
                animation: animation
            )
        }
    }
    static var previews: some View {
        TestCard()
    }
}
