![Viperit](/Assets/logo_light.jpg)

[![Language](https://img.shields.io/badge/swift-4.0-green.svg)](https://swift.org)
[![Build Status](https://travis-ci.org/ferranabello/Viperit.svg?branch=master)](https://travis-ci.org/ferranabello/Viperit)
[![Platform](http://img.shields.io/badge/platform-ios-blue.svg)](https://developer.apple.com/iphone/index.action)
[![License](http://img.shields.io/badge/license-MIT-orange.svg)](http://mit-license.org)
[![Codecov](https://img.shields.io/codecov/c/github/ferranabello/Viperit.svg)](https://codecov.io/gh/ferranabello/Viperit)
[![codebeat badge](https://codebeat.co/badges/17d36823-4e6c-4b45-bad3-746611689636)](https://codebeat.co/projects/github-com-ferranabello-viperit-master)
[![CocoaPods](https://img.shields.io/cocoapods/v/Viperit.svg)](http://github.com/ferranabello/Viperit)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Twitter](https://img.shields.io/badge/twitter-@acferran-blue.svg?style=flat)](http://twitter.com/acferran)

Write an iOS app following VIPER architecture. But in an **easy way**.


## Viper the easy way
We all know Viper is cool. But we also know that it's hard to setup. This library intends to simplify all that boilerplate process. If you don't know yet what Viper is, check this out: [Architecting iOS Apps with VIPER (objc.io)](https://www.objc.io/issues/13-architecture/viper/)

## Installation

### Requirements

- iOS 8.0+
- Swift 4 (for Swift 3 compatibility download the v0.8.0)
- Xcode 9

### CocoaPods

[CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa projects.

Specify Viperit into your project's Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'Viperit'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

To integrate Viperit into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "ferranabello/Viperit"
```

Run `carthage update` to build the framework and drag the built `Viperit.framework` into your Xcode project.

## Usage

### 0. Install the templates

Viperit Xcode templates can be found in the repository's `/Templates/Viperit` folder. To install them, open your terminal and run:

```bash
cd PATH/TO/REPO
mkdir -p ~/Library/Developer/Xcode/Templates/
cp -R Templates/Viperit ~/Library/Developer/Xcode/Templates/
```

Now, let's create our first Viperit module called "myFirstModule"!

### 1. Create a modules enum
You need at least one (you can use as many as you like, maybe to group modules by functionality) enum that implements the ViperitModule protocol to enumerate your application modules.
```swift
import Viperit

//MARK: - Application modules
enum AppModules: String, ViperitModule {
    case myFirstModule
}
```

### 2. Create the module
Let's use the provided Xcode template to easily create all the needed classes for the module. Just click <i class="icon-file"></i> **New file** in the document panel and select **Protocol-oriented module** or **Object-oriented module** under the "Viperit" section.

![Module Creation](/Assets/Instructions/module_creation.gif)

You can check "Also create a Storyboard file for module" if you want the storyboard file to be automatically created for you.
Choose between "Universal" to use just one view for phones and tablets, and "Dedicated Tablet View" if you want to have a separated view for tablet devices.

### 3. Build the module and perform navigation
Imagine this is a new app and we want to load our "myFirstModule" module as the app's startup module
```swift
import Viperit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let module = AppModules.myFirstModule.build()
        module.router.show(inWindow: window)
        return true
    }
}
```
This is just an example, you could of course use your own router functions instead of the provided show(inWindow:):
```swift
    window = UIWindow(frame: UIScreen.main.bounds)
    let module = AppModules.myFirstModule.build()
    let router = module.router as! MyFirstModuleRouter
    router.mySuperCoolShowFunction(inWindow: window)
```

### 4. Follow the Viper flow
Everything is ready for you to make great things the Viper way!
Clone the repo and run the 'Example' target to see it in action! Or just try it with Cocoapods:
```ruby
pod try Viperit
```

TODO
-------------
Extended documentation will be added **soon**

## Author

[Ferran Abelló](https://www.github.com/ferranabello "Ferran Abelló Github")

## License

Viperit is released under [MIT license](https://raw.githubusercontent.com/ferranabello/viperit/master/LICENSE) and copyrighted by Ferran Abelló.
