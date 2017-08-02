//
//  MXSlideTopicCell.m
//  Moxtra_Beta
//
//  Created by sunny on 2017/7/28.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXSlideTopicCell.h"
#import "Masonry.h"

@interface MXSlideTopicCell ()

@property(nonatomic, strong) NSImageView *iconView;
//@property(nonatomic, strong) NSTextField *titleField;

@end

@implementation MXSlideTopicCell

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
}

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    self.titleField = [[NSTextField alloc] init];
    self.titleField.editable = NO;
    self.titleField.bordered = NO;
    [self addSubview:self.titleField];
    [self.titleField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.offset(0.0f);
        make.bottom.offset(-1.0f);
    }];
    
}

@end

