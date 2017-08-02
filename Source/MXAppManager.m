//
//  MXAppManager.m
//  Moxtra_Beta
//
//  Created by sunny on 2017/8/1.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXAppManager.h"
#import "MXLoginWindowController.h"
#import "MXMainWindowController.h"

static MXAppManager *appInstance = nil;

@interface MXAppManager ()

@property (nonatomic, strong) MXAppDelegate *appDelegate;
@property (nonatomic, strong) MXLoginWindowController *LoginWindowController;
@property(nonatomic, strong) MXMainWindowController *mainWindowController;

@end

@implementation MXAppManager

+ (instancetype)sharedInstance
{
    return appInstance;
}

- (instancetype)initWithAppDelegate:(MXAppDelegate *)appDelegate
{
    self = [super init];
    appInstance = self;
    if (self)
    {
        self.appDelegate = appDelegate;
    }
    
    return self;
}

#pragma mark - Public Method
- (void)userStateChange
{
    if (!self.LoginWindowController)
    {
        self.LoginWindowController = [[MXLoginWindowController alloc] initWithWindowNibName:@"MXLoginWindowController"];
    }
    
    [self.LoginWindowController showWindow:nil];
    
}

- (void)showMainWindow
{
    if (!self.mainWindowController)
    {
        self.mainWindowController = [[MXMainWindowController alloc] initWithWindowNibName:@"MXMainWindowController"];
    }
    
    [self.mainWindowController showWindow:nil];
}

@end
