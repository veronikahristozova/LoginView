# VHLoginView

[![Version](https://img.shields.io/cocoapods/v/VHLoginView.svg?style=flat)](https://cocoapods.org/pods/VHLoginView)
[![License](https://img.shields.io/cocoapods/l/VHLoginView.svg?style=flat)](https://cocoapods.org/pods/VHLoginView)
[![Platform](https://img.shields.io/cocoapods/p/VHLoginView.svg?style=flat)](https://cocoapods.org/pods/VHLoginView)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Example
###[CocoaPods](https://cocoapods.org)
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 10.0+ / macOS 10.12+ / tvOS 10.0+ / watchOS 3.0+
- Xcode 10.2+
- Swift 5+

## Installation

VHLoginView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'VHLoginView'
```
### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate VHLoginView into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "veronikahristozova/VHLoginView" "1.0.0"
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but VHLoginView does support its use on supported platforms.

Once you have your Swift package set up, adding VHLoginView as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/veronikahristozova/VHLoginView.git", from: "1.0.0")
]
```

### Manually

If you prefer not to use any of those managers, you can integrate VHLoginView into your project manually.

#### Embedded Framework

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

  ```bash
  $ git init
  ```

- Add VHLoginView as a git [submodule](https://git-scm.com/docs/git-submodule) by running the following command:

  ```bash
  $ git submodule add https://github.com/veronikahristozova/VHLoginView.git
  ```

- Open the new `VHLoginView` folder, and drag the `VHLoginView.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `VHLoginView.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `VHLoginView.xcodeproj` folders each with two different versions of the `VHLoginView.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from, but it does matter whether you choose the top or bottom `VHLoginView.framework`.

- Select the top `VHLoginView.framework` for iOS and the bottom one for macOS.

    > You can verify which one you selected by inspecting the build log for your project. The build target for `VHLoginView` will be listed as either `VHLoginView iOS`, `VHLoginView macOS`, `VHLoginView tvOS` or `VHLoginView watchOS`.

- And that's it!

  > The `VHLoginView.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

## Author

Veronika Hristozova, veronikahristozova@gmail.com

## License

VHLoginView is available under the MIT license. See the LICENSE file for more info.
