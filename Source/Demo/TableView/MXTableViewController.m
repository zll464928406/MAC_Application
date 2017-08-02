/*
 1.改变tableview选中行背景的方法
 1.1 往tableview的xib里面拖入一个NSView
 1.2 给这个NSView设置identifier : NSTableViewRowViewKey
 1/3 让这个NSView继承MXTableRowView
 */

#import "MXTableViewController.h"
#import "MXFirstTypeTableCell.h"
#import "MXSecondTypeTableCell.h"
#import "MXTableView.h"
#import "MXTableRowView.h"
@interface MXTableViewController ()<NSTableViewDelegate, NSTableViewDataSource>

@property (weak) IBOutlet MXTableView *tableView;

@end

@implementation MXTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - NSTableViewDataSource
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return 100;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{

    if (row % 2 == 0)
    {
        MXFirstTypeTableCell *cellView = [tableView makeViewWithIdentifier:@"MXFirstTypeTableCell" owner:nil];
        cellView.titleTextField.stringValue = [NSString stringWithFormat:@"---%ld--", row];
        return cellView;
    }
    else
    {
        
        MXSecondTypeTableCell *cellView = [tableView makeViewWithIdentifier:@"MXSecondTypeTableCell" owner:nil];
//        cellView.binder = binder;
//        cellView.actionTarget = self;
//        cellView.acceptActioin = @selector(acceptButtonPressed:);
//        cellView.rejectActioin = @selector(rejectButtonPressed:);
//        [cellView updateContents];
        return cellView;
    }

    return nil;
}

#pragma mark - NSTableViewDelegate
- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
    return 60.0f;
}

- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row
{
    return YES;
}

- (void)tableView:(NSTableView *)tableView didClickTableColumn:(NSTableColumn *)tableColumn
{
    NSLog(@"-------");
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification
{
    NSTableView *tableView = notification.object;
}

@end
