# LMMSwitch

[![CI Status](https://img.shields.io/travis/isaaclzg/LMMSwitch.svg?style=flat)](https://travis-ci.org/isaaclzg/LMMSwitch)
[![Version](https://img.shields.io/cocoapods/v/LMMSwitch.svg?style=flat)](https://cocoapods.org/pods/LMMSwitch)
[![License](https://img.shields.io/cocoapods/l/LMMSwitch.svg?style=flat)](https://cocoapods.org/pods/LMMSwitch)
[![Platform](https://img.shields.io/cocoapods/p/LMMSwitch.svg?style=flat)](https://cocoapods.org/pods/LMMSwitch)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

LMMSwitch is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LMMSwitch'
```

```
/// 开关开启状态的顶部滑块颜色 默认白色
@property (nonatomic, strong) UIColor *onTintColor;

/// 开关关闭状态的顶部滑块颜色 默认白色
@property (nonatomic, strong) UIColor *offTintColor;

/// 开关开启状态的底部背景颜色 默认绿色
@property (nonatomic, strong) UIColor *onBackgroundColor;

/// 开关关闭状态的底部背景颜色 默认lightGrayColor
@property (nonatomic, strong) UIColor *offBackgroundColor;

/// 开关开启状态的的图片，设置后onTintColor无效
@property (nonatomic, strong) UIImage *onImage;

/// 开关关闭状态的的图片，设置后offTintColor无效
@property (nonatomic, strong) UIImage *offImage;

/// 开关边框颜色 默认无
@property (nonatomic, strong) UIColor *tintColor;

/// 开关的内边距，默认3,5,3,5
@property (nonatomic, assign) UIEdgeInsets padding;
```

## Author

[isaaclzg简书](https://www.jianshu.com/u/7e1b920cdac1)  
Isaac_gang@163.com

## License

LMMSwitch is available under the MIT license. See the LICENSE file for more info.
