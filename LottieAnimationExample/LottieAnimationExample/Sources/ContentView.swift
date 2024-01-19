//
//  ContentView.swift
//  LottieAnimationExample
//
//  Created by Siewert, Laura on 22.12.23.
//

import SwiftUI
import Lottie

struct ContentView: View {
	/// A state variable which holds the playback mode
	@State private var playbackMode: LottiePlaybackMode = LottiePlaybackMode.paused

	/// Body
	var body: some View {
		VStack(alignment: .leading) {
			ZStack {
				/// Image
				Image(ImageNames.displayedImage)
					.resizable()
					.frame(height: Dimens.imageHeight)
					.scaledToFit()
					.opacity(playbackMode != .paused ? Dimens.opacity05 : Dimens.opacity1)
					.animation(.linear, value: playbackMode)
				/// LottieView
				LottieView(animation: .named(ImageNames.heartAnimation))
					.playbackMode(playbackMode)
					.animationDidFinish { completed in
						/// Change the playback mode to paused, when animation is finished
						playbackMode = LottiePlaybackMode.paused
					}
					.resizable()
					/// Define the offset according to the playback mode and pair it with an animation modifier to animate the offset
					.offset(y: playbackMode != .paused ? Dimens.offSet0 : Dimens.offSetFull)
					.animation(.spring, value: playbackMode)
					.frame(height: Dimens.animationHeight)
			}
			Spacer()
			Button(action: {
				/// Change the playback mode to playing when the user pressed the button
				playbackMode = .playing(.fromProgress(0, toProgress: 1, loopMode: .playOnce))
			}, label: {
				HStack {
					Text(Strings.imageButtonTitle)
						.foregroundStyle(.white)
					Image(systemName: ImageNames.likeImage)
						.foregroundStyle(.white)
				}
				.padding(Dimens.padding16)
				.background(
					RoundedRectangle(cornerRadius: Dimens.cornerRadius)
						.fill(Color.black)
				)
			})
			Text(Strings.imageDescription)
				.foregroundStyle(.white)
				.padding(Dimens.padding16)
			Spacer()
		}
		.background(.black)
		.edgesIgnoringSafeArea(.all)
	}
}
