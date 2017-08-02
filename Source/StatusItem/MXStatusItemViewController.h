//
//  MXStatusItemViewController.h
//  Moxtra_Beta
//
//  Created by sunny on 2017/8/1.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MXStatusItemViewController : NSViewController

+ (instancetype)viewController;

@property (weak) IBOutlet NSButton *quitButton;
@property (weak) IBOutlet NSTabView *tabview;

- (IBAction)quitButtonAction:(id)sender;

@end
