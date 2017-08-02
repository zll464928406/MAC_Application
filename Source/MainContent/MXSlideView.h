//
//  MXSlideView.h
//  Moxtra_Beta
//
//  Created by sunny on 2017/7/28.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MXSlideView;

@protocol MXSlideViewDelegate <NSObject>

- (void)slideViewDelegate:(MXSlideView *)slideView didselectedRow:(NSInteger)row;

@end

@interface MXSlideView : NSView

@property(nonatomic,weak) id<MXSlideViewDelegate> delegate;
@property(nonatomic, strong) NSArray *dataArray;

- (void)reloadTableView;

@end
