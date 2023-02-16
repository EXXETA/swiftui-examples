#  Hero animations in SwiftUI with the matchedGeometryEffect modifier

## Description 

This project shows an example of how to use the matchedGeometryEffect in SwiftUI to create a hero animation. 

To use the matchedGeometryEffect we first need to define a namespace. This namespace is defined in the file `ContentView`.
```swift
@Namespace var animation
````
Next we need two views which will be added or removed by a state variable with an animation. This can also be found in the `ContentView`. 

```swift
ZStack {
    if isShowingDetail {
       CardDetail()
    } else {
        Card()
    }
}
.onTapGesture {
     withAnimation(.hero) {
        isShowingDetail.toggle()
    }
}
```

Last we need to define which elements should be matched by the matchedGeometryEffect. For example we need to attach the modifier for the image in the `Card` and in the `CardDetail` with the same id and SwiftUI will match those views during the transition. 

```swift
Image("header")
    .matchedGeometryEffect(id: AnimationId.imageId, in: animation)
```

## How to use the project 

The project was tested for iPhone 14 for the iOS Version 16. You need at least the Xcode version 14 to use the project. 

## Structure of the project

### `ContentView`

Shows either the `Card` or the `CardDetail` controlled by the state variable `isShowingDetail`. 

### `Card`

This view presents the small card. 

### `CardDetail`

This view presents the detail of the card. It is a expanded view of the small card. 

### `AnimatableTitle`

This view holds a title which can be animated by the modfier `animatableSystemFont`.


### `AnimatableLabel`

This view holds a label which can be animated by the modfier `animatableSystemFont`.

### `CloseButton`

This view presents a circular button which closes the CardDetail. 

### `Modifiers`

The project uses two custom modifiers. The first one is `cornerRadius` with which you can define the corner radius for specific corners. The second one is the `animatableSystemFont` modifier with which a font size can be animated. 

### `Animation+Extension`

This file defines used the hero animation.

### `Constants`

The project uses two constants files. The first one is the `Dimens` file, which specifies the used sizes in the project. The second is the `AnimationId`, which defines the used ids for the matchedGeometryEffect. 

