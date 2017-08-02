//
//  MXPopUpViewController.m
//  Moxtra_Beta
//
//  Created by sunny on 2017/8/2.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXPopUpViewController.h"
#import "Masonry.h"

@interface MXPopUpViewController ()

@end

@implementation MXPopUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpUI];
}

- (void)setUpUI
{
    /**********  pullsDown 设置为 YES 只有向下的箭头  (下拉框选项的样式)   *********************/
    NSPopUpButton *popBtn = [[NSPopUpButton alloc] initWithFrame:CGRectMake(0, 100, 100, 30) pullsDown:YES];
    [popBtn addItemWithTitle:@"城市"];
    [popBtn addItemWithTitle:@"上海"];
    [popBtn addItemWithTitle:@"广州"];
    popBtn.state = NSOnState;
    [popBtn setButtonType:NSButtonTypePushOnPushOff];
    [popBtn setHighlighted:NO];
    
    [self.view addSubview:popBtn];
    [popBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.left.equalTo(self.view).offset(10.0f);
        make.width.equalTo(@(100.0f));
        make.height.equalTo(@(30.0f));
    }];
    
    [popBtn setTarget:self];
    [popBtn setAction:@selector(popBtnClicked:)];
    
    /**********  图片的样式  *********************/
    NSPopUpButton *imagePopBtn = [[NSPopUpButton alloc] initWithFrame:CGRectMake(0, 100, 100, 30) pullsDown:YES];
//    [imagePopBtn setBezelStyle:NSBezelStyleRegularSquare];
//    [imagePopBtn setButtonType:NSButtonTypeMomentaryPushIn];
    [[imagePopBtn cell] setUsesItemFromMenu:NO];
    [imagePopBtn setBordered:NO];
    [imagePopBtn.cell setArrowPosition:NSPopUpNoArrow];
    [imagePopBtn setImage:[NSImage imageNamed:@"preference"]];
//    [imagePopBtn setImagePosition:NSNoImage];

    
    [imagePopBtn addItemWithTitle:@"城市"];
    [imagePopBtn addItemWithTitle:@"上海"];
    [imagePopBtn addItemWithTitle:@"广州"];
    [self.view addSubview:imagePopBtn];
    [imagePopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.left.equalTo(popBtn.mas_right).offset(10.0f);
        make.width.equalTo(@(50.0f));
        make.height.equalTo(@(50.0f));
    }];
    
    /**********  只有图片的按钮  *********************/
    NSButton *button = [NSButton buttonWithImage:[NSImage imageNamed:@"preference"] target:nil action:nil];
    [button setBordered:NO];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.left.equalTo(imagePopBtn.mas_right).offset(10.0f);
        make.width.equalTo(@(50.0f));
        make.height.equalTo(@(50.0f));
    }];
}

#pragma mark - User Action
- (void)popBtnClicked:(NSPopUpButton *)popBtn
{
    // 选中item 的索引
    NSLog(@"%zd", popBtn.indexOfSelectedItem);
    //    [popBtn selectItemAtIndex:popBtn.indexOfSelectedItem];
    popBtn.title = popBtn.selectedItem.title;
}

@end
