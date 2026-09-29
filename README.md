# Lorem Ipsum

*Lorem Ipsum* is a simple lorem ipsum generator for iOS, watchOS, tvOS, and macOS apps. It supports generating text in different formats (words, sentences, paragraphs), miscelianous data (names, URLs, dates etc.) and placeholder images.

This project was inspired by a great static site generator [Middleman](http://github.com/middleman/middleman). Its [lorem ipsum feature](https://github.com/middleman/middleman/blob/37e22c040ebcabed0ac3d8bce85aa085177d012a/middleman-core/lib/middleman-more/extensions/lorem.rb) was also a data source for this project.

#### Table of Contents

- [Installation](#installation)
- [Usage](#usage)
    - [Texts](#texts)
    - [Misc Data](#misc-data)
    - [Images](#images)
- [Example Projects](#example-projects)
- [Author](#author)
- [License](#license)

## Installation

### CocoaPods

*Lorem Ipsum* can be integrated into your Xcode project using CocoaPods by putting following line into your `Podfile` and running `pod install`:

```ruby
pod 'LoremIpsum', '~> 1.0'
```

### Swift Package Manager

*Lorem Ipsum* can be added as a Swift Package by including it in your `Package.swift` file.

### Manual
Alternatively you can copy the files `LoremIpsum.h` and `LoremIpsum.m` to your project.

## Usage

*Lorem Ipsum* is usable in both Objective-C and Swift. 

### Objective-C

Wherever you want to use *Lorem Ipsum* functionality, import the header file.

```objective-c
#import "LoremIpsum.h"
```
