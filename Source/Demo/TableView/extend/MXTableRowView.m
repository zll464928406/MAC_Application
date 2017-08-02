//
//  MXTableRowView.m
//  XeAgent
//
//  Created by Raymond Xu on 8/14/13.
//  Copyright (c) 2013 Moxtra, Inc. All rights reserved.
//

#import "MXTableRowView.h"
#import "MXTableView.h"

@implementation MXTableRowView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
    }
    
    return self;
}

- (void)drawSelectionInRect:(NSRect)dirtyRect
{
    NSColor *primaryColor = self.secondarySelectedControlColor? self.secondarySelectedControlColor: [[NSColor secondarySelectedControlColor] colorWithAlphaComponent:0.5];
    NSColor *secondarySelectedControlColor = self.secondarySelectedControlColor? self.secondarySelectedControlColor: [[NSColor secondarySelectedControlColor] colorWithAlphaComponent:0.5];
    
    // Implement our own custom alpha drawing
    switch (self.selectionHighlightStyle)
    {
        case NSTableViewSelectionHighlightStyleRegular:
        {
            if (self.selected)
            {
                if (self.emphasized)
                {
                    [primaryColor set];
                } else
                {
                    [secondarySelectedControlColor set];
                }
                NSRect bounds = self.bounds;
                const NSRect *rects = NULL;
                NSInteger count = 0;
                [self getRectsBeingDrawn:&rects count:&count];
                for (NSInteger i = 0; i < count; i++)
                {
                    NSRect rect = NSIntersectionRect(bounds, rects[i]);
                    NSRectFillUsingOperation(rect, NSCompositingOperationSourceOver);
                }
                
//                if (!self.isHideSelectedIndictaor) {
//                    [[NSColor colorWithCalibratedRed:0.08 green:0.52 blue:0.82 alpha:1] set];
//                    NSRectFill(NSMakeRect(NSWidth(self.bounds)-5, 0, 5, NSHeight(self.bounds)));
//                }
                
            }
            break;
        }
        default:
        {
            // Do super's drawing
            [super drawSelectionInRect:dirtyRect];
            break;
        }
    }
}
/*
static NSGradient *gradientWithTargetColor(NSColor *targetColor) {
    NSArray *colors = [NSArray arrayWithObjects:[targetColor colorWithAlphaComponent:0], targetColor, targetColor, [targetColor colorWithAlphaComponent:0], nil];
    const CGFloat locations[4] = { 0.0, 0.35, 0.65, 1.0 };
    return [[[NSGradient alloc] initWithColors:colors atLocations:locations colorSpace:[NSColorSpace sRGBColorSpace]] autorelease];
}
 */

- (NSRect)separatorRect
{
    NSRect separatorRect = self.bounds;
    separatorRect.origin.y = NSMaxY(separatorRect) - 1;
    separatorRect.size.height = 1;
    return separatorRect;
}

- (void)setFrame:(NSRect)frameRect
{
    [super setFrame:frameRect];
    // We need to invalidate more things when live-resizing since we fill with a gradient and stroke
    if ([self inLiveResize])
    {
        // Redraw everything if we are using a gradient
        // Redraw our horizontal grid line, which is a gradient
        [self setNeedsDisplayInRect:[self separatorRect]];
       
    }
}

- (void)drawSeparatorInRect:(NSRect)dirtyRect
{
    // Draw the grid
    if (!self.hideGrid)
    {
        if (self.gridColor)
        {
            [self drawSeparatorInRect:[self separatorRect] withColor:self.gridColor];
        }
        else
        {
            [self drawSeparatorInRect:[self separatorRect] withColor:[NSColor gridColor]];
        }
    }
}

- (void)drawSeparatorInRect:(NSRect)rect withColor:(NSColor*)color
{
    NSRect sepRect = rect;
    
    [color set];
    NSRectFill(sepRect);
    //sepRect.origin.x = 10;
    //sepRect.size.width -= 20;
    
    /*
    if ([[self superview] isKindOfClass:[MXTableView class]]) {
        NSTableView *tableView = (NSTableView*)[self superview];
        
        NSInteger selectedRowNumber = [tableView selectedRow];
        NSInteger ownRowNumber = [tableView rowForView:self];
        
        
        if (([self isSelected]) && ((selectedRowNumber + 1) < [tableView numberOfRows])){
            sepRect.origin.x = 0;
            sepRect.size.width = NSWidth(self.bounds);
        }
        if ((![self isSelected]) && (selectedRowNumber > 0) && (ownRowNumber == (selectedRowNumber-1))) {
            sepRect.origin.x = 0;
            sepRect.size.width = NSWidth(self.bounds);
        }
        
        if (!NSIsEmptyRect(sepRect)) {
            
            [color set];
            NSRectFill(sepRect);
        }
        
        if (([self isSelected]) && (selectedRowNumber > 0)) {
            MXTableRowView *rowView =[tableView rowViewAtRow:selectedRowNumber-1 makeIfNecessary:YES];
            [rowView setNeedsDisplay:YES];
        }
    }
     */
    
}


@end
