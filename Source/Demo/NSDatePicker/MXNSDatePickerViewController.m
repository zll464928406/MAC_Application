//
//  MXNSDatePickerViewController.m
//  MAC_Demo
//
//  Created by 张令林 on 2017/8/3.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXNSDatePickerViewController.h"
#import "Masonry.h"

@interface MXNSDatePickerViewController ()

//@property (weak) IBOutlet NSDatePicker *datepicker;

@property (nonatomic, strong) NSDatePicker *datepicker;

@end

@implementation MXNSDatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI
{
    self.datepicker = [[NSDatePicker alloc] init];
    self.datepicker.datePickerStyle = NSClockAndCalendarDatePickerStyle;
    [self.datepicker setMinDate:[NSDate dateWithTimeIntervalSinceNow:-24*60*60*30]];
    self.datepicker.datePickerElements = NSYearMonthDayDatePickerElementFlag;
    [self.datepicker setTarget:self];
    [self.datepicker setAction:@selector(dateChanged:)];
    [self.view addSubview:self.datepicker];
    [self.datepicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10.0f);
        make.left.offset(10.0f);
        make.width.mas_equalTo(139);
        make.height.mas_equalTo(148);
    }];
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:-24*60*60*15];
    NSDatePickerCell *pickerCell = [[NSDatePickerCell alloc] initTextCell:@"cell"];
    pickerCell.dateValue = date;
    [self.datepicker selectCell:pickerCell];
}

#pragma mark - User Action
- (void)dateChanged:(id)sender
{
    NSDatePicker *datePicker = sender;
    NSLog(@"valued Changed dateValue %@",datePicker.dateValue);
}

@end
