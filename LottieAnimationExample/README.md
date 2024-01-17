#  A guide for seamlessly integrating animations in SwiftUI with LottieView

## Description 

This project shows an example of how to use the LottieView in combination with SwiftUI. 

## Integrate Lottie to your project


To incorporate the Lottie Framework in Xcode, you can integrate it by using [Swift Package Manager or Cocoa Pods](https://github.com/airbnb/lottie-ios). Once integrated, simply import Lottie to start using it. 

For an appealing animation, LottieFiles is an excellent resource. You can find and download animations, including some that are [license-free](https://lottiefiles.com/page/license). In our example, we'll use the heart animation by [Biswajit Rout](https://lottiefiles.com/animations/heart-E3NfCZitfh). Import the downloaded JSON file into your Xcode project to kickstart the implementation. 

## Quick guide to Lottie in SwiftUI

To load a Lottie animation in SwiftUI, we can use the LottieView.  And add the modifier .playing() to start the animation. It’s just that easy. Wwhen you start your app you can see the animation playing.

```swift
struct ContentView: View { 
    var body: some View { 
        VStack { 
            LottieView(animation: .named("heartAnimation")) 
                .playing() 
        } 
    } 
} 
```

But there is more you can do with your animation. You can adjust it to your needs.  The playing() modifier can be configured with a LottiePlaybackMode. Here you can specify, from which, frame or progress you want to play your animation or in which loopMode.  

```swift
LottieView(animation: .named("heartAnimation")) 
    .playing(.fromFrame(1, toFrame: 5, loopMode: .playOnce)) 
```

You can also directly use the playbackMode Modifier like this:  

```swift
LottieView(animation: .named("heartAnimation")) 
    .playbackMode(.playing(.fromFrame(1, toFrame: 5, loopMode: .playOnce))) 
```

With this modifier you can also pause your animation by setting it to paused. 

```swift
LottieView(animation: .named("heartAnimation")) 
    .playbackMode(.paused) 
```
You can also respond to the completion of the animation by using the animationDidFinish modifier to trigger specific actions. 

```swift
LottieView(animation: .named("heartAnimation")) 
    .playing(loopMode: .loop) 
    .animationDidFinish { completed in 
        /// Do sth. 
    } 
```
## How to use the project 

The project was tested for iPhone 14 for the iOS Version 17. You need at least the Xcode version 15 to use the project. 

## Structure of the project

### `ContentView`

Shows the main view an image, button and text. It will also display the lottie animation

### `Ressources`

Holds the needed assets. The JSON File `heartAnimation.json` and the displayed image in the `Assets`.

## Example

We can create our desired animation. First, we create the needed UI. This contains a ZStack with the image and the LottieView and a Button for liking the image, with some description underneath.  

Now we want to play the animation when the button is pressed. For this, we need a state variable that holds the LottiePlaybackMode. In the beginning, this mode is set to paused. When we click on the button, we set it to playing and when the animation is finished, we set it back to paused again.  

```swift
@State private var playbackMode: LottiePlaybackMode = LottiePlaybackMode.paused   
… 

LottieView(animation: .named("heartAnimation")) 
    .playbackMode(playbackMode) 
    .animationDidFinish { completed in 
        playbackMode = LottiePlaybackMode.paused 
    } 
… 
Button(action: { 
    playbackMode = .playing(.fromProgress(0, toProgress: 1, loopMode: .playOnce)) 
    }, label: { … }) 
… 
```

The last step is to animate the LottieView up and down with the offset Modifier and change the opacity of the image. We can achieve this by reacting to the State of the playbackMode.  

```swift
Image("image") 
    .opacity(playbackMode != .paused ? 0.5 : 1) 
    .animation(.linear, value: playbackMode) 
… 
LottieView(animation: .named("heartAnimation")) 
    .offset(y: playbackMode != .paused ? 0 : -UIScreen.main.bounds.height) 
    .animation(.spring, value: playbackMode) 
… 
```