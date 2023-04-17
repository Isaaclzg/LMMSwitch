//
//  LMMSwitch.h
//  LMMSwitch
//
//  Created by apple on 2023/4/15.
//

#import <UIKit/UIKit.h>

@class LMMSwitch;
typedef void (^SwitchValueChangeBlock) (LMMSwitch *swith, BOOL on);

@protocol LMMSwitchDelegate <NSObject>

@optional
- (void)switchValueChange:(LMMSwitch *)swith on:(BOOL)on;

@end

@interface LMMSwitch : UIView

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

/// 查看开关打开状态, 默认为关闭
@property (nonatomic, readonly, getter=isOn) BOOL on;

/// 开关状态改变回调block
@property (nonatomic, copy) SwitchValueChangeBlock switchValueChange;

/// delegate
@property (nonatomic, weak) id <LMMSwitchDelegate> delegate;

@end
