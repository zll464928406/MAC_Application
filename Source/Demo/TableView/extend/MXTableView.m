//
//  MXTableView.m
//  Moxtra_Beta
//
//  Created by sunny on 2017/8/1.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXTableView.h"
#import "MXTableRowView.h"

@interface MXTableView ()

@end

@implementation MXTableView
- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)mouseDown:(NSEvent *)theEvent
{
    NSPoint globalLocation = [theEvent locationInWindow];
    NSPoint localLocation = [self convertPoint:globalLocation fromView:nil];
    NSInteger clickedRow = [self rowAtPoint:localLocation];
    
    [super mouseDown:theEvent];
    
    if (clickedRow != -1)
    {
        [self.extendedDelegate tableView:self didClickedRow:clickedRow];
    }
}


- (CGFloat)yPositionPastLastRow
{
    // Only draw the grid past the last visible row
    NSInteger numberOfRows = self.numberOfRows;
    CGFloat yStart = 0;
    if (numberOfRows > 0) {
        yStart = NSMaxY([self rectOfRow:numberOfRows - 1]);
    }
    return yStart;
}

@end
