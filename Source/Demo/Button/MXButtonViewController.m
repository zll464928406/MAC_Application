//
//  MXButtonViewController.m
//  MAC_Demo
//
//  Created by 张令林 on 2017/8/3.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXButtonViewController.h"
#import "Masonry.h"

@interface MXButtonViewController ()

@end

@implementation MXButtonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI
{
    // 只有一张图片的按钮
    NSButton *button = [NSButton buttonWithImage:[NSImage imageNamed:@"preference"] target:self action:@selector(buttonClicked:)];
    [button setBordered:NO];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(10.0f);
        make.left.equalTo(self.view).offset(10.0f);
        make.width.equalTo(@(50.0f));
        make.height.equalTo(@(50.0f));
    }];
    
    // 只有文字的按钮
    NSButton *btn = [NSButton buttonWithTitle:@"title" target:self action:@selector(buttonClicked:)];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button.mas_bottom).offset(10.0f);
        make.left.equalTo(self.view).offset(10.0f);
        make.width.equalTo(@(100.0f));
        make.height.equalTo(@(30.0f));
    }];
    
    // 带有背景图案的按钮
    NSButton *btn1 = [NSButton buttonWithTitle:@"title" target:self action:@selector(buttonClicked:)];
    [btn1 setImage:[NSImage imageNamed:@"button_bg"]];
    [btn1 setBordered:NO];
    [btn1 setImagePosition:NSImageOverlaps];
    [btn1 setImageScaling:NSScaleToFit];
    [self.view addSubview:btn1];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn.mas_bottom).offset(10.0f);
        make.left.equalTo(self.view).offset(10.0f);
        make.width.equalTo(@(100.0f));
        make.height.equalTo(@(30.0f));
    }];
    
    // 带有图片和文字的按钮
    NSButton *btn2 = [NSButton buttonWithTitle:@"title" target:self action:@selector(buttonClicked:)];
    [btn2 setButtonType:NSMomentaryLightButton];
    [btn2 setImage:[NSImage imageNamed:@"app_common"]];
    [btn2 setImagePosition:NSImageLeft];
    [btn2 setImageScaling:NSImageScaleProportionallyUpOrDown];
    [self.view addSubview:btn2];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn1.mas_bottom).offset(10.0f);
        make.left.equalTo(self.view).offset(10.0f);
        make.width.equalTo(@(100.0f));
        make.height.equalTo(@(30.0f));
    }];
}

#pragma mark - User Action
- (void)buttonClicked:(id)sender
{
    NSLog(@"button have clicked!!");
}

@end
