//
//  LMMViewController.m
//  LLMMSwitch
//
//  Created by isaaclzg on 04/17/2023.
//  Copyright (c) 2023 isaaclzg. All rights reserved.
//

#import "LMMViewController.h"
#import <LMMSwitch.h>
#import <Masonry.h>

@interface LMMViewController ()<LMMSwitchDelegate>

@end

@implementation LMMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    LMMSwitch *switchBtn = [[LMMSwitch alloc] init];
    [self.view addSubview:switchBtn];
    switchBtn.delegate = self;
    switchBtn.onTintColor = UIColor.redColor;
    switchBtn.onBackgroundColor = UIColor.yellowColor;
    switchBtn.offTintColor = UIColor.blueColor;
    switchBtn.offBackgroundColor = UIColor.blackColor;
    switchBtn.onImage = [UIImage imageNamed:@"on"];
    switchBtn.offImage = [UIImage imageNamed:@"off"];
    switchBtn.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    [switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(@51);
        make.height.equalTo(@31);
    }];
    switchBtn.switchValueChange = ^(LMMSwitch *swith, BOOL on) {
        NSLog(@"block:%@",on ? @"开" : @"关");
    };
}

#pragma mark - —————————————————————LMMSwitchDelegate—————————————————————
- (void)switchValueChange:(LMMSwitch *)swith on:(BOOL)on {
    NSLog(@"delegate:%@",on ? @"开" : @"关");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
