//
//  MXStatusItemViewController.m
//  Moxtra_Beta
//
//  Created by sunny on 2017/8/1.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXStatusItemViewController.h"

@interface MXStatusItemViewController ()

@end

@implementation MXStatusItemViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

+ (instancetype)viewController
{
    return [[[self class] alloc] initWithNibName:NSStringFromClass([self class]) bundle:nil];
}

- (CGSize)preferredContentSize
{
    return self.view.frame.size;
}

#pragma mark - User Action
- (IBAction)quitButtonAction:(id)sender
{
    [[NSApplication sharedApplication] terminate:self];
}

- (IBAction)switchContentViewControllerAction:(id)sender
{
    //    [[CCNStatusItem sharedInstance] updateContentViewController:[ContentView2Controller viewController]];
}

@end
