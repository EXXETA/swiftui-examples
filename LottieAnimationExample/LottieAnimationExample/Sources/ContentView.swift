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
				Image("image")
					.resizable()
					.frame(height: UIScreen.main.bounds.width)
					.scaledToFit()
					.opacity(playbackMode != .paused ? 0.5 : 1)
					.animation(.linear, value: playbackMode)
				/// LottieView
				LottieView(animation: .named("heartAnimation"))
					.playbackMode(playbackMode)
					.animationDidFinish { completed in
						/// Change the playback mode to paused, when animation is finished
						playbackMode = LottiePlaybackMode.paused
					}
					.resizable()
				    /// Define the offset according to the playback mode and pair it with an animation modifier to animate the offset
					.offset(y: playbackMode != .paused ? 0 : -UIScreen.main.bounds.height)
					.animation(.spring, value: playbackMode)
					.frame(height: UIScreen.main.bounds.width - 100)
			}
			Spacer()
			Button(action: {
				/// Change the playback mode to playing when the user pressed the button
				playbackMode = .playing(.fromProgress(0, toProgress: 1, loopMode: .playOnce))
			}, label: {
				HStack {
					Text("Like Image")
						.foregroundStyle(.white)
					Image(systemName: "heart")
						.foregroundStyle(.white)
				}
				.padding(16)
				.background(
					RoundedRectangle(cornerRadius: 16)
						.fill(Color.black)
				)
			})
			Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.")
				.foregroundStyle(.white)
				.padding(16)
			Spacer()
        }
		.background(.black)
		.edgesIgnoringSafeArea(.all)
    }
}
