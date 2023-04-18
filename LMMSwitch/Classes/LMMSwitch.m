//
//  LMMSwitch.m
//  LMMSwitch
//
//  Created by apple on 2023/4/15.
//

#import "LMMSwitch.h"
#import <Masonry/Masonry.h>

@interface LMMSwitch()

@property (nonatomic, strong) UIImageView *topView;

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, assign) CGSize switchSize;

@property (nonatomic, assign) CGSize size;

@end

@implementation LMMSwitch

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.onTintColor = self.offTintColor = UIColor.whiteColor;
    self.onBackgroundColor = UIColor.greenColor;
    self.offBackgroundColor = UIColor.lightGrayColor;

    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    MASAttachKeys(self.topView);
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(5).priorityHigh();
        make.top.equalTo(self).offset(3).priorityHigh();
        make.bottom.equalTo(self).offset(-3).priorityHigh();
        make.width.equalTo(self.topView.mas_height).priorityHigh();
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.bottomView.layer.cornerRadius = self.bottomView.frame.size.height / 2;
        self.bottomView.layer.masksToBounds = YES;
        
        self.topView.layer.cornerRadius = self.topView.frame.size.height / 2;
        self.topView.layer.masksToBounds = YES;
    });
    
    self.padding = UIEdgeInsetsMake(3, 5, 3, 5);
    [self setSwitchColorWithStatus:_on];
}

- (void)setOn:(BOOL)newOn animated:(BOOL)animated {
    
    [self layoutIfNeeded];
    __block CGRect frame = self.topView.frame;
    CGFloat newX = newOn ? self.frame.size.width - self.topView.frame.size.width - self.padding.right : self.padding.left;
    [UIView animateWithDuration:animated ? 0.2 : 0.0 animations:^{
        frame.origin.x = newX;
        self.topView.frame = frame;
        [self setSwitchColorWithStatus:newOn];
    } completion:^(BOOL finished) {
        if (finished) {
            if ([self.delegate respondsToSelector:@selector(switchValueChange:on:)]) {
                [self.delegate switchValueChange:self on:newOn];
            }
            if (self.switchValueChange) {
                self.switchValueChange(self, newOn);
            }
        }
    }];
    _on = newOn;
}

- (void)setSwitchColorWithStatus:(BOOL)on {
    
    self.bottomView.backgroundColor = on ? _onBackgroundColor : _offBackgroundColor;
    if (self.onImage && !self.offImage) {
        self.topView.image = self.onImage;
    }else if (!self.onImage && self.offImage) {
        self.topView.image = self.offImage;
    }else if (self.onImage && self.offImage) {
        self.topView.image = on ? self.onImage : self.offImage;
    }else {
        self.topView.backgroundColor = on ? _onTintColor : _offTintColor;
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setOn:!_on animated:YES];
}

#pragma mark - —————————————————————Setter—————————————————————
- (void)setOnTintColor:(UIColor *)onTintColor {
    _onTintColor = onTintColor;
    
    [self setSwitchColorWithStatus:_on];
}

- (void)setOffTintColor:(UIColor *)offTintColor {
    _offTintColor = offTintColor;
    
    [self setSwitchColorWithStatus:_on];
}

- (void)setOnBackgroundColor:(UIColor *)onBackgroundColor {
    _onBackgroundColor = onBackgroundColor;
    
    [self setSwitchColorWithStatus:_on];
}

- (void)setOffBackgroundColor:(UIColor *)offBackgroundColor {
    _offBackgroundColor = offBackgroundColor;
    
    [self setSwitchColorWithStatus:_on];
}

- (void)setOnImage:(UIImage *)onImage {
    _onImage = onImage;
    
    [self setSwitchColorWithStatus:_on];
}

- (void)setOffImage:(UIImage *)offImage {
    _offImage = offImage;
    
    [self setSwitchColorWithStatus:_on];
}

- (void)setTintColor:(UIColor *)tintColor {
    _tintColor = tintColor;
    
    self.topView.layer.borderColor = self.bottomView.layer.borderColor = tintColor.CGColor;
    self.topView.layer.borderWidth = self.bottomView.layer.borderWidth = 0.5f;
    [self setSwitchColorWithStatus:_on];
}

- (void)setPadding:(UIEdgeInsets)padding {
    _padding = padding;
    
    [self setSwitchColorWithStatus:_on];
    [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(padding.left);
        make.top.equalTo(self).offset(padding.top);
        make.bottom.equalTo(self).offset(-padding.bottom);
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.topView.layer.cornerRadius = self.topView.frame.size.height / 2;
        self.topView.layer.masksToBounds = YES;
    });
}

- (void)setOn:(BOOL)on {
    _on = on;
    
    [self layoutIfNeeded];
    __block CGRect frame = self.topView.frame;
    CGFloat newX = on ? self.frame.size.width - self.topView.frame.size.width - self.padding.right : self.padding.left;
    [UIView animateWithDuration:0.2 animations:^{
        frame.origin.x = newX;
        self.topView.frame = frame;
        [self setSwitchColorWithStatus:on];
    } completion:^(BOOL finished) {
        if (finished) {
            
        }
    }];
}

#pragma mark - —————————————————————Lazy Method—————————————————————
- (UIImageView *)topView {
    if (nil == _topView) {
        _topView = [[UIImageView alloc] init];
        [self addSubview:_topView];
        _topView.backgroundColor = UIColor.whiteColor;
        _topView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _topView;
}

- (UIView *)bottomView {
    if (nil == _bottomView) {
        _bottomView = [[UIView alloc] init];
        [self addSubview:_bottomView];
        _bottomView.backgroundColor = UIColor.lightGrayColor;
    }
    return _bottomView;
}

@end

