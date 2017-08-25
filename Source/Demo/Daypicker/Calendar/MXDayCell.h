//
//  MXDayCell.h
//  MAC_Demo
//
//  Created by sunny on 2017/8/25.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class MXCalendarView;

@interface MXDayCell : NSButton

@property (weak) MXCalendarView* owner;
@property (nonatomic, strong) NSDate* representedDate;
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, assign) BOOL marked;

@end
