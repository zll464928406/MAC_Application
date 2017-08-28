//
//  MXCalendarView.m
//  MAC_Demo
//
//  Created by sunny on 2017/8/25.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXCalendarView.h"
#import "Masonry.h"
#import "MXDayCell.h"

#define kTopMargin 20.0f
#define kButtonLeftMargin 10.0f
#define kButtonWidth 20.0f

#define kWeekDayColumnNumbers 7
#define kDayCellColumnNumbers 7
#define kDayCellRowNumbers 6

@interface MXCalendarView ()

@property (nonatomic, strong) NSView *topicContainer;
@property (nonatomic, strong) NSView *dayCellContainer;
@property (nonatomic, strong) NSButton *preButton;
@property (nonatomic, strong) NSButton *nextButton;
@property (nonatomic, strong) NSTextField *titleTextField;
@property (nonatomic, strong) NSView *weekDayContainer;

@property (strong) NSMutableArray *weekDayLabels;
@property (strong) NSMutableArray<NSMutableArray*> *dayCells;

@end

@implementation MXCalendarView

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
}

- (instancetype)initWithDate:(NSDate*)date
{
    self = [super init];
    if (self)
    {
        [self setUpUI];
        
        self.backgroundColor = [NSColor whiteColor];
        self.textColor = [NSColor blackColor];
        self.selectionColor = [NSColor redColor];
        self.todayMarkerColor = [NSColor greenColor];
        self.dayMarkerColor = [NSColor darkGrayColor];
        self.dayCells = [NSMutableArray array];
        self.weekDayLabels = [NSMutableArray array];
        for(int i = 0; i < kDayCellRowNumbers; i++)
        {
            [self.dayCells addObject:[NSMutableArray array]];
        }
        
        for(int i = 0; i < kWeekDayColumnNumbers; i++)
        {
            NSString* weekDayId = [NSString stringWithFormat:@"day%d",i+1];
            NSTextField* weekDayTextField = [self fetchViewByID:weekDayId inSuperView:self.weekDayContainer];
            [self.weekDayLabels addObject:weekDayTextField];
        }
        for(int row = 0; row < kDayCellRowNumbers; row++)
        {
            for(int col = 0; col < kDayCellColumnNumbers; col++)
            {
                NSString* dayCellId = [NSString stringWithFormat:@"c%d", (row*7)+col+1];
                MXDayCell* dayCell = [self fetchViewByID:dayCellId inSuperView:self.dayCellContainer];
                dayCell.target = self;
                dayCell.action = @selector(cellClicked:);
                [self.dayCells[row] addObject:dayCell];
                dayCell.owner = self;
            }
        }
        
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        NSArray *weekDays = [df shortStandaloneWeekdaySymbols];
        for(NSInteger i = 0; i < weekDays.count;i++)
        {
            NSString* weekDay = [weekDays[i] uppercaseString];
            NSInteger column = [self columnForWeekDayIdentify:i+1];
            NSTextField* tf = self.weekDayLabels[column];
            tf.stringValue = weekDay;
        }
        self.date = date;
        [self layoutCalendar];
    }
    return self;
}

#pragma mark - Private Methods
- (void)setUpUI
{
    self.topicContainer = [[NSView alloc] init];
    self.topicContainer.wantsLayer = YES;
    self.topicContainer.layer.backgroundColor = [NSColor whiteColor].CGColor;
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
    
    self.weekDayContainer = [[NSView alloc] init];
    self.weekDayContainer.wantsLayer = YES;
    self.weekDayContainer.layer.backgroundColor = [NSColor whiteColor].CGColor;
    [self.topicContainer addSubview:self.weekDayContainer];
    [self.weekDayContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.topicContainer);
        make.height.equalTo(self.topicContainer).multipliedBy(0.4);
    }];
    
    [self setUpWeekDayLabel];
    [self setUpDayCell];
}

- (void)setUpWeekDayLabel
{
    for (int i = 0; i < kWeekDayColumnNumbers; i++)
    {
        NSTextField *weekDayTextField = [[NSTextField alloc] init];
        weekDayTextField.stringValue = @"SUN";
        weekDayTextField.identifier = [NSString stringWithFormat:@"day%zd", i+1];
        [weekDayTextField setAlignment:NSTextAlignmentCenter];
        [weekDayTextField setBordered:NO];
        [weekDayTextField setEditable:NO];
        weekDayTextField.backgroundColor = [NSColor clearColor];
        [self.weekDayContainer addSubview:weekDayTextField];
        [weekDayTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.weekDayContainer);
            make.height.equalTo(self.weekDayContainer);
            make.width.equalTo(self.weekDayContainer).multipliedBy(1.0f/7.0f);
            if (i == 0)
            {
                make.left.equalTo(self.weekDayContainer);
            }
            else
            {
                NSView *freView = [self fetchViewByID:[NSString stringWithFormat:@"day%zd", i] inSuperView:self.weekDayContainer];
                make.left.equalTo(freView.mas_right);
            }
        }];
    }
}

- (void)setUpDayCell
{
    for (int i = 0; i < kDayCellRowNumbers; i++)
    {
        NSView *dayCellColumnContainer = [[NSView alloc] init];
        dayCellColumnContainer.wantsLayer = YES;
        dayCellColumnContainer.layer.backgroundColor = [NSColor whiteColor].CGColor;
        dayCellColumnContainer.identifier = [NSString stringWithFormat:@"row%zd", i+1];
        [self.dayCellContainer addSubview:dayCellColumnContainer];
        [dayCellColumnContainer mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.dayCellContainer);
            make.height.equalTo(self.dayCellContainer).multipliedBy(1.0/6.0f);
            if (i == 0)
            {
                make.top.equalTo(self.dayCellContainer);
            }
            else
            {
                NSView *freView = [self fetchViewByID:[NSString stringWithFormat:@"row%zd", i] inSuperView:self.dayCellContainer];
                make.top.equalTo(freView.mas_bottom);
            }
        }];
        
        for (int j = 0; j < kDayCellColumnNumbers; j++)
        {
            MXDayCell *dayCell = [[MXDayCell alloc] init];
            dayCell.identifier = [NSString stringWithFormat:@"c%zd", 7*i+j+1];
            [dayCellColumnContainer addSubview:dayCell];
            [dayCell mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(dayCellColumnContainer);
                make.width.equalTo(dayCellColumnContainer).multipliedBy(1.0/7.0f);
                if (j == 0)
                {
                    make.left.equalTo(dayCellColumnContainer);
                }
                else
                {
                    NSView *freView = [self fetchViewByID:[NSString stringWithFormat:@"c%zd", 7*i+j] inSuperView:dayCellColumnContainer];
                    make.left.equalTo(freView.mas_right);
                }
            }];
        }
    }
}

- (id)fetchViewByID:(NSString*)_id inSuperView:(NSView*)superView
{
    if (superView == self.dayCellContainer)
    {
        for(NSView *dayCellContainer in self.dayCellContainer.subviews)
        {
            for (NSView *dayCell in dayCellContainer.subviews)
            {
                if ([dayCell.identifier isEqualToString:_id])
                {
                    return dayCell;
                }
            }
        }
    }
    
    for (NSView *subview in superView.subviews)
    {
        if([subview.identifier isEqualToString:_id])
        {
            return subview;
        }
    }
    
    return nil;
}

- (void)layoutCalendar
{
    for(int row = 0; row < 6;row++)
    {
        for(int col = 0; col < 7; col++)
        {
            MXDayCell *dayCell = self.dayCells[row][col];
            dayCell.representedDate = nil;
            dayCell.selected = NO;
        }
    }
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    unsigned unitFlags = NSCalendarUnitWeekday;
    NSDateComponents *components = [calendar components:unitFlags fromDate:[self getDateForMonthDay:1]];
    NSInteger firstDayIdentify = components.weekday;
    NSInteger lastDayIdentify = [self lastDayOfTheMonth];
    NSInteger columnForFirstDay = [self columnForWeekDayIdentify:firstDayIdentify];
    NSInteger day = 1;
    for(int row = 0; row < 6;row++)
    {
        for(NSInteger column = columnForFirstDay; column < 7; column++)
        {
            if(day <= lastDayIdentify)
            {
                MXDayCell *cell = self.dayCells[row][column];
                NSDate* date = [self getDateForMonthDay:day];
                cell.representedDate = date;
                BOOL selected = [MXCalendarView isSameDate:date date:_selectedDate];
                cell.selected = selected;
                cell.marked = YES;
                day++;
            }
        }
        columnForFirstDay = 0;
    }
}

- (NSDate*)toUTC:(NSDate*)d
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned unitFlags = NSCalendarUnitDay| NSCalendarUnitYear | NSCalendarUnitMonth;
    NSDateComponents *components = [cal components:unitFlags fromDate:d];
    cal.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    return [cal dateFromComponents:components];
}

- (NSDate*)getDateForMonthDay:(NSInteger)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    unsigned unitFlags = NSCalendarUnitDay| NSCalendarUnitYear | NSCalendarUnitMonth;
    NSDateComponents *components = [calendar components:unitFlags fromDate:self.date];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    comps.day = day;
    comps.year = components.year;
    comps.month = components.month;
    return [calendar dateFromComponents:comps];
}

- (NSInteger)lastDayOfTheMonth
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    NSRange daysRange = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self.date];
    return daysRange.length;
}

- (NSInteger)columnForWeekDayIdentify:(NSInteger)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    //firstWeekday 表示一周的哪一天作为第一天,0代表周一作为第一天
    NSInteger column = day - calendar.firstWeekday;
    if(column < 0)
    {
        column = 7 + column;
    }
    return column;
}

#pragma mark - User Action
- (void)preButtonClicked:(id)sender
{
    [self stepMonth:-1];
}

- (void)nextButtonClicked:(id)sender
{
    [self stepMonth:1];
}

- (void)cellClicked:(id)sender
{
    for(int row = 0; row < 6;row++)
    {
        for(int col = 0; col < 7; col++)
        {
            MXDayCell*cell = self.dayCells[row][col];
            cell.selected = NO;
        }
    }
    
    MXDayCell* cell = sender;
    cell.selected = YES;
    _selectedDate = cell.representedDate;
    if(self.delegate)
    {
        if([self.delegate respondsToSelector:@selector(didSelectDate:)])
        {
            [self.delegate didSelectDate:self.selectedDate];
        }
    }
}

- (void)stepMonth:(NSInteger)dm
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    cal.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    unsigned unitFlags = NSCalendarUnitDay| NSCalendarUnitYear | NSCalendarUnitMonth;
    NSDateComponents *components = [cal components:unitFlags fromDate:self.date];
    NSInteger month = components.month + dm;
    NSInteger year = components.year;
    if(month > 12)
    {
        month = 1;
        year++;
    };
    if(month < 1)
    {
        month = 12;
        year--;
    }
    components.year = year;
    components.month = month;
    self.date = [cal dateFromComponents:components];
}

#pragma mark - Class Methods
+ (BOOL) isSameDate:(NSDate*)d1 date:(NSDate*)d2
{
    if(d1 && d2)
    {
        NSCalendar *cal = [NSCalendar currentCalendar];
        cal.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
        unsigned unitFlags = NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitMonth;
        NSDateComponents *components = [cal components:unitFlags fromDate:d1];
        NSInteger ry = components.year;
        NSInteger rm = components.month;
        NSInteger rd = components.day;
        components = [cal components:unitFlags fromDate:d2];
        NSInteger ty = components.year;
        NSInteger tm = components.month;
        NSInteger td = components.day;
        return (ry == ty && rm == tm && rd == td);
    } else
    {
        return NO;
    }
}

#pragma mark - Getter & Setter
- (void) setDate:(NSDate *)date
{
    _date = [self toUTC:date];
    [self layoutCalendar];
    NSCalendar *cal = [NSCalendar currentCalendar];
    cal.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    unsigned unitFlags = NSCalendarUnitDay| NSCalendarUnitYear | NSCalendarUnitMonth;
    NSDateComponents *components = [cal components:unitFlags fromDate:self.date];
    NSInteger month = components.month;
    NSInteger year = components.year;
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    NSString *monthName = [df standaloneMonthSymbols][month-1];
    NSString* mnFirstLetter = [[monthName substringToIndex:1] uppercaseString];
    NSString* mnLastPart = [monthName substringFromIndex:1];
    monthName = [NSString stringWithFormat:@"%@%@",mnFirstLetter,mnLastPart];
    NSString* budgetDateSummary = [NSString stringWithFormat:@"%@, %ld",monthName,year];
    self.titleTextField.stringValue = budgetDateSummary;
}

- (void) setSelectedDate:(NSDate *)selectedDate
{
    _selectedDate = [self toUTC:selectedDate];
    for(int row = 0; row < 6;row++)
    {
        for(int col = 0; col < 7; col++)
        {
            MXDayCell*cell = self.dayCells[row][col];
            BOOL selected = [MXCalendarView isSameDate:cell.representedDate date:_selectedDate];
            cell.selected = selected;
        }
    }
    
}

@end
