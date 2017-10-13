//
//  MXPopoverViewController.m
//  MAC_Demo
//
//  Created by sunny on 2017/8/23.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXPopoverViewController.h"
#import "ShareViewController.h"

@interface MXPopoverViewController ()<NSPopoverDelegate>

@property (nonatomic, strong) NSPopover *popover1;
@property (nonatomic, strong) ShareViewController *shareViewController;

@end

@implementation MXPopoverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI
{
    self.shareViewController = [[ShareViewController alloc] init];
    
    self.popover1 = [[NSPopover alloc] init];
    self.popover1.contentViewController = self.shareViewController;
    self.popover1.behavior = NSPopoverBehaviorApplicationDefined;// 当前方式需要手动关 , 选择其他方式可以点击空白处自动关闭
    self.popover1.appearance = [NSAppearance appearanceNamed:NSAppearanceNameAqua];
    self.popover1.delegate = self;
}

#pragma mark - User Action
- (IBAction)showPopover:(id)sender
{
    NSButton *button = sender;
    [self.popover1 showRelativeToRect:button.bounds ofView:button preferredEdge:NSRectEdgeMinX];
}

- (IBAction)close:(id)sender
{
    [self.popover1 performClose:nil];
}

#pragma mark - NSPopoverDelegate
- (void)popoverWillShow:(NSNotification *)notification
{
    
}

- (void)popoverDidShow:(NSNotification *)notification
{
    
}

- (void)popoverWillClose:(NSNotification *)notification
{
    
}

- (void)popoverDidClose:(NSNotification *)notification
{
    
}

@end
