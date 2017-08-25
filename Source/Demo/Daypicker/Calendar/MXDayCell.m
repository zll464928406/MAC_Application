//
//  MXDayCell.m
//  MAC_Demo
//
//  Created by sunny on 2017/8/25.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXDayCell.h"

@implementation MXDayCell
/*
- (instancetype)initWithFrame: (NSRect)frameRect
{
    self = [super initWithFrame: frameRect];
    if (self)
    {
        self.bordered = NO;
        self.representedDate = nil;
    }
    
    return self;
}

- (BOOL) isToday
{
    if(self.representedDate)
    {
        return 	[MLCalendarView isSameDate:self.representedDate date:[NSDate date]];
    } else
    {
        return NO;
    }
}

- (void) setSelected:(BOOL)selected
{
    _selected = selected;
    self.needsDisplay = YES;
}

- (void) setRepresentedDate:(NSDate *)representedDate
{
    _representedDate = representedDate;
    if(_representedDate)
    {
        NSCalendar *cal = [NSCalendar currentCalendar];
        cal.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
        unsigned unitFlags = NSCalendarUnitDay;// | NSCalendarUnitYear | NSCalendarUnitMonth;
        NSDateComponents *components = [cal components:unitFlags fromDate:_representedDate];
        NSInteger day = components.day;
        self.title = [NSString stringWithFormat:@"%ld",day];
    } else
    {
        self.title = @"";
    }
}

- (void)drawRect:(NSRect)dirtyRect
{
    if(self.owner)
    {
        [NSGraphicsContext saveGraphicsState];
        
        NSRect bounds = [self bounds];
        
        [self.owner.backgroundColor set];
        NSRectFill(bounds);
        
        
        if(self.representedDate)
        {
            //selection
            if(self.selected)
            {
                NSRect circeRect = NSInsetRect(bounds, 3.5f, 3.5f);
                circeRect.origin.y += 1;
                NSBezierPath* bzc = [NSBezierPath bezierPathWithOvalInRect:circeRect];
                [self.owner.selectionColor set];
                [bzc fill];
            }
            
            NSMutableParagraphStyle * aParagraphStyle = [[NSMutableParagraphStyle alloc] init];
            [aParagraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
            [aParagraphStyle setAlignment:NSCenterTextAlignment];
            
            
            //title
            NSDictionary *attrs = @{NSParagraphStyleAttributeName: aParagraphStyle,NSFontAttributeName: self.font,NSForegroundColorAttributeName: self.owner.textColor};
            
            NSSize size = [self.title sizeWithAttributes:attrs];
            
            NSRect r = NSMakeRect(bounds.origin.x,// + (bounds.size.width - size.width)/2.0,
                                  bounds.origin.y + ((bounds.size.height - size.height)/2.0) - 1,
                                  bounds.size.width,
                                  size.height);
            
            [self.title drawInRect:r withAttributes:attrs];
            
            
            //line
            NSBezierPath* topLine = [NSBezierPath bezierPath];
            [topLine moveToPoint:NSMakePoint(NSMinX(bounds), NSMinY(bounds))];
            [topLine lineToPoint:NSMakePoint(NSMaxX(bounds), NSMinY(bounds))];
            [self.owner.dayMarkerColor set];
            topLine.lineWidth = 0.3f;
            [topLine stroke];
            if([self isToday])
            {
                [self.owner.todayMarkerColor set];
                NSBezierPath* bottomLine = [NSBezierPath bezierPath];
                [bottomLine moveToPoint:NSMakePoint(NSMinX(bounds), NSMaxY(bounds))];
                [bottomLine lineToPoint:NSMakePoint(NSMaxX(bounds), NSMaxY(bounds))];
                bottomLine.lineWidth = 4.0f;
                [bottomLine stroke];
            }
            
            if (self.marked)
            {
                [[NSColor blackColor] set];
                NSBezierPath *path=[NSBezierPath bezierPathWithOvalInRect:NSMakeRect((bounds.size.width - 5.0f)/2, bounds.size.height - 7.0f, 5.0f, 5.0f)];
                [path fill];
            }
        }
        [NSGraphicsContext restoreGraphicsState];
    }
}
*/

@end
