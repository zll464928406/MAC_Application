//
//  MXButtonViewController.m
//  MAC_Demo
//
//  Created by 张令林 on 2017/8/3.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXButtonViewController.h"
#import "Masonry.h"
#import "MXButton.h"

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
    NSButton *btn = [NSButton buttonWithTitle:@"正常的只有文本的按钮" target:self action:@selector(buttonClicked:)];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button.mas_bottom).offset(10.0f);
        make.left.equalTo(self.view).offset(10.0f);
        make.height.equalTo(@(30.0f));
    }];
    [btn sizeToFit];
    
    // 带有背景图案的按钮
    NSButton *btn1 = [NSButton buttonWithTitle:@"带有背景图片" target:self action:@selector(buttonClicked:)];
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
    
    /*******************************  自己定义的类生成button  ************************************/
    MXButton *mxBtn = [[MXButton alloc] initWithFrame:CGRectMake(20.0, 20.0, 60.0, 30.0)];
    mxBtn.title = @"带有边框切有高亮颜色变化";
    mxBtn.momentary = YES;
    mxBtn.cornerRadius = 4.0;
    mxBtn.borderWidth = 1.0f;
    mxBtn.borderNormalColor = [NSColor blackColor];
    mxBtn.backgroundNormalColor = [NSColor whiteColor];
    mxBtn.backgroundHighlightColor = [NSColor grayColor];
    mxBtn.titleNormalColor = [NSColor orangeColor];
    mxBtn.titleHighlightColor = [NSColor orangeColor];
    [mxBtn sizeToFit];
    [self.view addSubview:mxBtn];
    [mxBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn2.mas_bottom).offset(10.0f);
        make.left.equalTo(self.view).offset(10.0f);
        make.height.equalTo(@(30.0f));
    }];
    
    MXButton *mxBtn1 = [[MXButton alloc] initWithFrame:CGRectMake(20.0, 20.0, 60.0, 30.0)];
    mxBtn1.title = @"带有图片和文字的按钮";
    [mxBtn1 setImage:[NSImage imageNamed:@"app_common"]];
    [mxBtn1 setButtonType:NSMomentaryLightButton];
    [mxBtn1 setImagePosition:NSImageLeft];
    [mxBtn1 setImageScaling:NSImageScaleProportionallyUpOrDown];
    mxBtn1.momentary = YES;
    mxBtn1.cornerRadius = 4.0;
    mxBtn1.borderWidth = 1.0f;
    mxBtn1.borderNormalColor = [NSColor blackColor];
    mxBtn1.borderHighlightColor = [NSColor blackColor];
    mxBtn1.backgroundNormalColor = [NSColor whiteColor];
    mxBtn1.backgroundHighlightColor = [NSColor grayColor];
    mxBtn1.backgroundNormalColor = [NSColor whiteColor];
    mxBtn1.backgroundHighlightColor = [NSColor grayColor];
    mxBtn1.titleNormalColor = [NSColor orangeColor];
    mxBtn1.titleHighlightColor = [NSColor orangeColor];
    [mxBtn1 sizeToFit];
    [self.view addSubview:mxBtn1];
    [mxBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mxBtn.mas_bottom).offset(10.0f);
        make.left.equalTo(self.view).offset(10.0f);
        make.height.equalTo(@(30.0f));
        make.width.equalTo(@(200.0f));
    }];
    
    //只有图片的按钮 , 有高亮和正常两种状态
    MXButton *mxBtn2 = [[MXButton alloc] initWithFrame:CGRectMake(20.0, 20.0, 60.0, 60.0)];
    mxBtn2.momentary = YES;
    mxBtn2.cornerRadius = 30.0;
    mxBtn2.borderWidth = 1.0f;
    [mxBtn2 setImage:[NSImage imageNamed:@"app_common"]];
    mxBtn2.borderNormalColor = [NSColor blackColor];
    mxBtn2.borderHighlightColor = [NSColor blackColor];
    mxBtn2.backgroundNormalColor = [NSColor whiteColor];
    mxBtn2.backgroundHighlightColor = [NSColor grayColor];
    mxBtn2.imageNormalColor = [NSColor orangeColor];
    mxBtn2.imageHighlightColor = [NSColor whiteColor];
    [self.view addSubview:mxBtn2];
    [mxBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mxBtn1.mas_bottom).offset(10.0f);
        make.left.equalTo(self.view).offset(10.0f);
        make.height.equalTo(@(60.0f));
        make.width.equalTo(@(60.0f));
    }];
    
}

#pragma mark - User Action
- (void)buttonClicked:(id)sender
{
    NSLog(@"button have clicked!!");
}

@end
