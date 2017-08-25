//
//  MXDayPickerViewController.m
//  MAC_Demo
//
//  Created by sunny on 2017/8/25.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXDayPickerViewController.h"
#import "MXCalendarView.h"
#import "Masonry.h"
@interface MXDayPickerViewController ()

@property (nonatomic, strong) MXCalendarView *calendarView;

@end

@implementation MXDayPickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI
{
    self.calendarView = [[MXCalendarView alloc] init];
    [self.view addSubview:self.calendarView];
    [self.calendarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.view);
        make.width.mas_equalTo(278.0f);
        make.height.mas_equalTo(314.0f);
    }];
}

@end
