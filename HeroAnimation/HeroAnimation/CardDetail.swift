//
// From Mobile@Exxeta by Laura Siewert
// https://medium.com/@mobile_44538
//

import SwiftUI

struct CardDetail: View {
    // MARK: - Properties
    @Binding var isShowingDetail: Bool
    @Binding var isAppeared: Bool
    let animation: Namespace.ID
    
    // MARK: - Private State
    @State private var animateText: Bool = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack(alignment: .bottom) {
                // MARK: - Header
                VStack(spacing: 0) {
                    Image("header")
                        .resizable()
                        .matchedGeometryEffect(id: AnimationId.imageId, in: animation, anchor: .top)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: Dimens.cardDetailImageHeight)
                        .padding(.vertical, 2*Dimens.unit24)
                    Spacer()
                        .frame(height: UIScreen.main.bounds.height - Dimens.cardImageHeight + Dimens.unit24)
                }
                .frame(width: UIScreen.main.bounds.width)
                .background(
                    Color.black
                        .cornerRadius(0)
                        .matchedGeometryEffect(id: AnimationId.imageBackgroundId, in: animation)
                )
                // MARK: - Content
                VStack(alignment: .leading, spacing: 0) {
                    AnimatableTitle(isAppeared: isAppeared)
                        .matchedGeometryEffect(id: AnimationId.titleId, in: animation)
                        .padding(.bottom, Dimens.unit16)
                    HStack(spacing: Dimens.unit12) {
                        AnimatableLabels(isAppeared: isAppeared, text: "10 Points")
                            .matchedGeometryEffect(id: AnimationId.label1Id, in: animation)
                        AnimatableLabels(isAppeared: isAppeared, text: "Clarification")
                            .matchedGeometryEffect(id: AnimationId.label2Id, in: animation)
                    }
                    .padding(.bottom, Dimens.unit24)
                    Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.")
                        .opacity(animateText ? 1 : 0)
                }
                .padding(Dimens.unit24)
                .background(
                    Color.white
                        .cornerRadius(Dimens.unit24, corners: [.topLeft, .topRight])
                        .matchedGeometryEffect(id: AnimationId.textBackgroundId, in: animation)
                )
            }
        }
        .mask {
            RoundedRectangle(cornerRadius: 0)
                .matchedGeometryEffect(id: AnimationId.backgroundShapeId, in: animation)
        }
        .onAppear {
            UIScrollView.appearance().bounces = false
            
            withAnimation(.linear) {
                isAppeared = isShowingDetail
            }
            withAnimation(.linear.delay(0.2)) {
                animateText = true
            }
        }
        .onDisappear {
            withAnimation(.linear) {
                animateText = false
            }
        }
        // MARK: - Close Button
        .overlay(
            CloseButton(isShowingDetail: $isShowingDetail)
                .opacity(isAppeared ? 1 : 0)
                .padding(.top, Dimens.unit24)
                .padding(.trailing, Dimens.unit24),
            alignment: .topTrailing
        )
        .statusBarHidden(true)
        .ignoresSafeArea()
    }
}


struct CardDetail_Previews: PreviewProvider {
    struct TestCardDetail: View {
        @Namespace var animation
        var body: some View {
            CardDetail(
                isShowingDetail: .constant(true),
                isAppeared: .constant(true),
                animation: animation
            )
        }
    }
    static var previews: some View {
        TestCardDetail()
    }
}

