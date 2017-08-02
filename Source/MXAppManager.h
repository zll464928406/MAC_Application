//
//  MXAppManager.h
//  Moxtra_Beta
//
//  Created by sunny on 2017/8/1.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MXAppDelegate.h"

@interface MXAppManager : NSObject

+ (instancetype)sharedInstance;
- (instancetype)initWithAppDelegate:(MXAppDelegate *)appDelegate;

- (void)userStateChange;
- (void)showMainWindow;

@end
