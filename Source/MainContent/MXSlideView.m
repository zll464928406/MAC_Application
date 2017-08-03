//
//  MXSlideView.m
//  Moxtra_Beta
//
//  Created by sunny on 2017/7/28.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXSlideView.h"
#import "Masonry.h"
#import "MXSlideTopicCell.h"

@interface MXSlideView ()<NSTableViewDelegate, NSTableViewDataSource>

@property(nonatomic, strong) NSScrollView *scrollView;
@property(nonatomic, strong) NSTableView *tableView;

@property(nonatomic, assign) CGFloat rowHeight;
@property(nonatomic, assign) CGFloat disableScroller;

@end

@implementation MXSlideView

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
    self.wantsLayer = YES;
    self.layer.backgroundColor = [NSColor grayColor].CGColor;
    
    self.rowHeight = 40.0f;
    self.disableScroller = YES;
    
    self.scrollView    = [[NSScrollView alloc] init];
    self.scrollView.hasVerticalScroller  = YES;
    self.scrollView.frame = self.bounds;
    self.scrollView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    [self addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(0.0f);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
    self.tableView = [[NSTableView alloc] init];
    self.tableView.frame = self.scrollView.frame;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.scrollView.contentView.documentView = self.tableView;
    //    self.tableView.headerView = nil;
    [self.tableView registerNib:nil forIdentifier:@"MXSlideTopicCell"];
    // 3.0.创建表列
    NSTableColumn *chatColumen = [[NSTableColumn alloc] initWithIdentifier:@"chatColumen"];
    chatColumen.title = @"列表";
    chatColumen.headerCell.alignment = NSTextAlignmentCenter;
    // 3.1.设置最小的宽度
    chatColumen.minWidth =  self.tableView.frame.size.width;
    // 3.2.允许用户调整宽度
    chatColumen.resizingMask = NSTableColumnUserResizingMask | NSTableColumnAutoresizingMask;
    // 3.3.添加到表视图
    [self.tableView addTableColumn:chatColumen];
    /*
     NSTableColumnNoResizing        不能改变宽度
     NSTableColumnAutoresizingMask  拉大拉小窗口时会自动布局
     NSTableColumnUserResizingMask  允许用户调整宽度
     */
}

#pragma mark - Public Method
- (void)reloadTableView
{
    if (self.disableScroller == YES)
    {
        self.scrollView.hasVerticalScroller = NO;
        self.scrollView.hasVerticalRuler = NO;
        [self.tableView setFrameOrigin:NSZeroPoint];
    }
    [self.tableView reloadData];
}

#pragma mark - NSTableViewDataSource
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return self.dataArray.count;
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    return nil;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    // 1.0.创建一个Cell
    NSTextField *view = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 100, 30)];
    view.bordered = NO;
    view.editable = NO;
    // 1.1.判断是哪一列
    if ([tableColumn.identifier isEqualToString:@"chatColumen"])
    {
        view.stringValue = [NSString stringWithFormat:@"第1列的第%ld个Cell",row + 1];
    }else
    {
        view.stringValue = [NSString stringWithFormat:@"不知道哪列的第%ld个Cell",row + 1];
    }
    MXSlideTopicCell *cell = [tableView makeViewWithIdentifier:@"MXSlideTopicCell" owner:nil];
    if (!cell)
    {
        cell = [[MXSlideTopicCell alloc] init];
    }
    NSString *typeString = [[self.dataArray objectAtIndex:row] valueForKey:@"type"];
    cell.titleField.stringValue = [NSString stringWithFormat:@"%ld. %@", row + 1, typeString];
    return cell;
}

#pragma mark - NSTableViewDelegate
-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
    return self.rowHeight;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification
{
    NSTableView *tableView = notification.object;
    NSInteger row = tableView.selectedRow;
    if ([self.delegate respondsToSelector:@selector(slideViewDelegate:didselectedRow:)])
    {
        [self.delegate slideViewDelegate:self didselectedRow:row];
    }
}

@end
