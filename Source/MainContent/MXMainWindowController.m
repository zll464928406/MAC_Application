//
//  MXMainWindowController.m
//  Moxtra_Beta
//
//  Created by sunny on 2017/7/28.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXMainWindowController.h"
#import "Masonry.h"
#import "MXSlideView.h"

@interface MXMainWindowController ()<MXSlideViewDelegate>

@property(nonatomic, strong) MXSlideView *slideContentView;
@property(nonatomic, strong) NSViewController *currentContentViewController;

@end

@implementation MXMainWindowController

- (void)windowDidLoad
{
    [super windowDidLoad];
    //hide window title
    self.window.titlebarAppearsTransparent = YES;
    self.window.titleVisibility = NSWindowTitleHidden;
    
    self.slideView.wantsLayer = YES;
    self.slideView.layer.backgroundColor = [NSColor whiteColor].CGColor;
    self.contentView.wantsLayer = YES;
    self.contentView.layer.backgroundColor = [NSColor whiteColor].CGColor;

    self.slideContentView = [[MXSlideView alloc] init];
    self.slideContentView.delegate = self;
    [self.slideView addSubview:self.slideContentView];
    [self.slideContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.slideView);
    }];

    self.slideContentView.dataArray = @[@{@"type":@"NSTableView", @"className":@"MXTableViewController"},
                                        @{@"type":@"NSPopUpButton", @"className":@"MXPopUpViewController"},
                                        @{@"type":@"NSButton", @"className":@"MXButtonViewController"},
                                        @{@"type":@"NSDatePicker", @"className":@"MXNSDatePickerViewController"},
                                        @{@"type":@"NSPopover", @"className":@"MXPopoverViewController"},
                                        @{@"type":@"NSDayPicker", @"className":@"MXDayPickerViewController"},
                                        @{@"type":@"NSSearchField", @"className":@"MXSearchFieldViewController"}
                                        ];
    [self.slideContentView reloadTableView];
}

#pragma mark - User Action
- (IBAction)actionsSegmentedControlClicked:(id)sender
{
    NSSegmentedControl *segmentedControl = sender;
    if (segmentedControl.selectedSegment == 0)
    {
        NSLog(@"0");
    }
    else if (segmentedControl.selectedSegment == 1)
    {
        NSLog(@"1");
    }
    else
    {
        NSLog(@"2");
    }
}

#pragma mark - MXSlideViewDelegate
-(void)slideViewDelegate:(MXSlideView *)slideView didselectedRow:(NSInteger)row
{
    NSString *viewName = [[self.slideContentView.dataArray objectAtIndex:row] valueForKey:@"className"];
    NSLog(@"clicked on row:%ld, %@", row, viewName);
    [self.contentView.subviews enumerateObjectsUsingBlock:^(__kindof NSView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    self.currentContentViewController = [[NSClassFromString(viewName) alloc] initWithNibName:viewName bundle:nil];
    [self.contentView addSubview:self.currentContentViewController.view];
    [self.currentContentViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}


@end
