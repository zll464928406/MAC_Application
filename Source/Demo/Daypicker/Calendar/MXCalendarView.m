//
//  MXCalendarView.m
//  MAC_Demo
//
//  Created by sunny on 2017/8/25.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXCalendarView.h"
#import "Masonry.h"

#define kTopMargin 20.0f
#define kButtonLeftMargin 10.0f
#define kButtonWidth 20.0f

@interface MXCalendarView ()

@property(nonatomic, strong) NSView *topicContainer;
@property(nonatomic, strong) NSView *dayCellContainer;

@property(nonatomic, strong) NSButton *preButton;
@property(nonatomic, strong) NSButton *nextButton;
@property(nonatomic, strong) NSTextField *titleTextField;

@end

@implementation MXCalendarView

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setUpUI];
    }
    return self;
}

#pragma mark - Private Methods
- (void)setUpUI
{
    self.topicContainer = [[NSView alloc] init];
    self.topicContainer.wantsLayer = YES;
    self.topicContainer.layer.backgroundColor = [NSColor orangeColor].CGColor;
    [self addSubview:self.topicContainer];
    [self.topicContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
    }];
    
    self.dayCellContainer = [[NSView alloc] init];
    self.dayCellContainer.wantsLayer = YES;
    self.dayCellContainer.layer.backgroundColor = [NSColor grayColor].CGColor;
    [self addSubview:self.dayCellContainer];
    [self.dayCellContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(self.topicContainer.mas_bottom);
        make.height.equalTo(self.topicContainer).multipliedBy(3.0f);
    }];
    
    self.preButton = [NSButton buttonWithImage:[NSImage imageNamed:@"NSLeftFacingTriangleTemplate"] target:self action:@selector(preButtonClicked:)];
    [self.preButton setBordered:NO];
    [self.topicContainer addSubview:self.preButton];
    [self.preButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topicContainer).offset(kTopMargin);
        make.left.equalTo(self.topicContainer).offset(kButtonLeftMargin);
        make.width.equalTo(@(kButtonWidth));
        make.height.equalTo(@(kButtonWidth));
    }];
    
    self.nextButton = [NSButton buttonWithImage:[NSImage imageNamed:@"NSRightFacingTriangleTemplate"] target:self action:@selector(nextButtonClicked:)];
    [self.nextButton setBordered:NO];
    [self.topicContainer addSubview:self.nextButton];
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topicContainer).offset(kTopMargin);
        make.right.equalTo(self.topicContainer).offset(-kButtonLeftMargin);
        make.width.equalTo(@(kButtonWidth));
        make.height.equalTo(@(kButtonWidth));
    }];
    
    
    self.titleTextField = [[NSTextField alloc] init];
    self.titleTextField.stringValue = @"February, 2015";
    [self.titleTextField setAlignment:NSTextAlignmentCenter];
    [self.titleTextField setBordered:NO];
    [self.titleTextField setEditable:NO];
    self.titleTextField.backgroundColor = [NSColor clearColor];
    [self.topicContainer addSubview:self.titleTextField];
    [self.titleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.preButton);
        make.left.equalTo(self.preButton.mas_right).offset(kButtonLeftMargin);
        make.right.equalTo(self.nextButton.mas_left).offset(-kButtonLeftMargin);
    }];
    
}

#pragma mark - User Action
- (void)preButtonClicked:(id)sender
{
    
}

- (void)nextButtonClicked:(id)sender
{
    
}


@end
