//
//  MXTableView.h
//  Moxtra_Beta
//
//  Created by sunny on 2017/8/1.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol ExtendedTableViewDelegate <NSObject>

- (void)tableView:(NSTableView *)tableView didClickedRow:(NSInteger)row;

@end

@interface MXTableView : NSTableView

@property (nonatomic, weak) id<ExtendedTableViewDelegate> extendedDelegate;

@end
