//
//  MXSearchFieldViewController.m
//  MAC_Demo
//
//  Created by sunny on 2017/9/5.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXSearchFieldViewController.h"
#import "Masonry.h"

@interface MXSearchFieldViewController ()<NSSearchFieldDelegate>

@property (nonatomic, strong) NSSearchField *searchField;
@property (nonatomic, assign) NSInteger lastSearchSelection;

@end

@implementation MXSearchFieldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpUI];
}

- (void)setUpUI
{
    self.searchField = [[NSSearchField alloc] init];
    self.searchField.delegate = self;
    [self.view addSubview:self.searchField];
    [self.searchField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.mas_equalTo(200.0f);
        
    }];
    
    // 获取控件两端的按钮并绑定事件
    NSActionCell *searchCell = [[self.searchField cell] searchButtonCell];
    searchCell.target = self;
    searchCell.action = @selector(searchCellClicked:);
    NSActionCell *cancelhCell = [[self.searchField cell] cancelButtonCell];
    cancelhCell.target = self;
    cancelhCell.action = @selector(cancelhCellClicked:);
    
    //添加下拉列表
    NSMenu *cellMenu = [[NSMenu alloc] initWithTitle:NSLocalizedString(@"Search Menu",@"Search Menu title")];
    NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:@"Title" action:@selector(setSearchCategoryFrom:) keyEquivalent:@""];
    [item setTarget:self];
    [item setTag:1];
    [cellMenu insertItem:item atIndex:0];
    
    item = [[NSMenuItem alloc] initWithTitle:@"Username" action:@selector(setSearchCategoryFrom:) keyEquivalent:@""];
    [item setTarget:self];
    [item setTag:2];
    [cellMenu insertItem:item atIndex:1];
    id searchFieldCell = [self.searchField cell];
    [searchFieldCell setSearchMenuTemplate:cellMenu];
}

#pragma mark - User Action
-(void)searchCellClicked:(id)sender
{
    
}

-(void)cancelhCellClicked:(id)sender
{
    self.searchField.stringValue = @"";   
}

- (IBAction)setSearchCategoryFrom:(NSMenuItem *)sender
{
    [[[sender menu] itemWithTag:self.lastSearchSelection] setState:NSOffState];
    [sender setState: NSOnState];
    self.lastSearchSelection = [sender tag];
}

#pragma mark - NSSearchFieldDelegate
-(void)controlTextDidChange:(NSNotification *)obj
{
    
}

-(void)controlTextDidEndEditing:(NSNotification *)obj
{
    
}

-(void)searchFieldDidStartSearching:(NSSearchField *)sender
{
    
}

-(void)searchFieldDidEndSearching:(NSSearchField *)sender
{
    
}

@end
