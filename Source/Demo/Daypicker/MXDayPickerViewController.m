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
@interface MXDayPickerViewController ()<MXCalendarViewDelegate, NSTextFieldDelegate>

@property (nonatomic, strong) MXCalendarView *calendarView;
@property (nonatomic, strong) NSButton *setTodayButton;
@property (nonatomic, strong) NSTextField *titleTextField;

@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end

@implementation MXDayPickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"yyyy/MM/dd"];
    
    [self setUpUI];
}

- (void)setUpUI
{
    self.calendarView = [[MXCalendarView alloc] initWithDate:[NSDate date]];
    self.calendarView.delegate = self;
    [self.view addSubview:self.calendarView];
    [self.calendarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.view);
        make.width.mas_equalTo(278.0f);
        make.height.mas_equalTo(314.0f);
    }];
    
    self.setTodayButton = [[NSButton alloc] init];
    [self.setTodayButton setTitle:@"today"];
    [self.setTodayButton setTarget:self];
    [self.setTodayButton setAction:@selector(setTodayButtonClicked:)];
    [self.view addSubview:self.setTodayButton];
    [self.setTodayButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.calendarView.mas_right).offset(10.0);
        make.top.equalTo(self.calendarView);
    }];
    
    self.titleTextField = [[NSTextField alloc] init];
    self.titleTextField.delegate = self;
    self.titleTextField.stringValue = @"2017/09/10";
    [self.titleTextField setAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.titleTextField];
    [self.titleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.setTodayButton.mas_right).offset(10.0);
        make.width.mas_equalTo(100.0f);
        make.top.equalTo(self.setTodayButton);
    }];
}

#pragma mark - User Action
- (void)setTodayButtonClicked:(id)sender
{
    NSString *timeString = [self.dateFormatter stringFromDate:[NSDate date]];
    self.titleTextField.stringValue = timeString;
    self.calendarView.date = [NSDate date];
}

#pragma mark - MXCalendarViewDelegate
- (void)didSelectDate:(NSDate *)selectedDate
{
    if (selectedDate)
    {
        NSLog(@"%@----",selectedDate);
        NSString *timeString = [self.dateFormatter stringFromDate:selectedDate];
        self.titleTextField.stringValue = timeString;
    }
}

#pragma mark - NSTextFieldDelegate
-(void)controlTextDidEndEditing:(NSNotification *)obj
{
    NSDate *date = [self.dateFormatter dateFromString:self.titleTextField.stringValue];
    self.calendarView.date = date;
}

@end
