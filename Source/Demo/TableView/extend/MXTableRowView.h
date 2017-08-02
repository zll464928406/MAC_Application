//
//  MXTableRowView.h
//  XeAgent
//
//  Created by Raymond Xu on 8/14/13.
//  Copyright (c) 2013 Moxtra, Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MXTableRowView : NSTableRowView

@property (nonatomic, readwrite, strong)NSColor *gridColor;
@property (nonatomic, readwrite, assign)BOOL isHideSelectedIndictaor;
@property (nonatomic, readwrite, strong)NSColor *primaryColor;
@property (nonatomic, readwrite, strong)NSColor *secondarySelectedControlColor;
@property (nonatomic, readwrite, assign)BOOL hideGrid;
@end

void DrawSeparatorInRect(NSRect rect, NSColor *color);