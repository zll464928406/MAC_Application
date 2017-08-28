//
//  MXCalendarView.h
//  MAC_Demo
//
//  Created by sunny on 2017/8/25.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol MXCalendarViewDelegate <NSObject>
- (void)didSelectDate:(NSDate*)selectedDate;
@end

@interface MXCalendarView : NSView

@property (nonatomic, strong) NSColor* backgroundColor;
@property (nonatomic, strong) NSColor* textColor;
@property (nonatomic, strong) NSColor* selectionColor;
@property (nonatomic, strong) NSColor* todayMarkerColor;
@property (nonatomic, strong) NSColor* dayMarkerColor;

@property (nonatomic, strong) NSDate* date;
@property (nonatomic, strong) NSDate* selectedDate;
@property (nonatomic, weak) id<MXCalendarViewDelegate> delegate;

+ (BOOL) isSameDate:(NSDate*)d1 date:(NSDate*)d2;
- (instancetype)initWithDate:(NSDate*)date;

@end
