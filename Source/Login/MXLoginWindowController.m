//
//  MXLoginWindowController.m
//  Moxtra_Beta
//
//  Created by sunny on 2017/8/1.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXLoginWindowController.h"
#import "MXAppManager.h"

@interface MXLoginWindowController ()

@end

@implementation MXLoginWindowController

- (void)windowDidLoad
{
    [super windowDidLoad];
    self.window.title = @"LoginWindow";
}

#pragma mark - User Action
- (IBAction)loginButtonClicked:(id)sender
{
//    [self.window close];
    [[MXAppManager sharedInstance] showMainWindow];
}

@end
