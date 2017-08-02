//
//  MXAppDelegate.m
//  Moxtra_Beta
//
//  Created by sunny on 2017/7/28.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXAppDelegate.h"
#import "MXAppManager.h"
#import "CCNStatusItem.h"
#import "MXStatusItemViewController.h"

@interface MXAppDelegate ()



@end

@implementation MXAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // init the statusItem
    [[CCNStatusItem sharedInstance] presentStatusItemWithImage:[NSImage imageNamed:@"status_logo_black"] contentViewController:[MXStatusItemViewController viewController]];
    
    // init appManager
    MXAppManager *appManager = [[MXAppManager alloc] initWithAppDelegate:self];
    
    [appManager showMainWindow];
}

-(BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag
{
    //[[MXAppManager sharedInstance] userStateChange];
    [[MXAppManager sharedInstance] showMainWindow];
    return YES;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
    
}

#pragma mark User Action

@end
