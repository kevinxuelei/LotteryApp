//
//  ILBaseTableViewController.m
//  ItheimaLottery
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ILBaseTableViewController.h"

#import "ILSettingCell.h"

#import "ILSettingItem.h"

#import "ILSettingArrowItem.h"
#import "ILSettingSwitchItem.h"

#import "ILSettingGroup.h"

@interface ILBaseTableViewController ()

@end

@implementation ILBaseTableViewController

- (NSMutableArray *)dataList
{
    if (_dataList == nil) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}


// 初始化方法
- (id)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 244 243 241
    
    // 设置tableView的背景颜色
    // ios6 backgroundView > backgroundColor
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = ILColor(244, 243, 241);
    
    // 设置组间距
    self.tableView.sectionHeaderHeight = 20;
    self.tableView.sectionFooterHeight = 0;
    
#warning 适配ios7的组间距
    if (ios7) {
        
        self.tableView.contentInset = UIEdgeInsetsMake(-15, 0, 0, 0);
    }
    

}



#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    ILSettingGroup *group = self.dataList[section];
    return group.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 创建cell
    ILSettingCell *cell = [[ILSettingCell class] cellWithTableView:tableView];
    
    NSLog(@"%@",NSStringFromCGRect(cell.frame));
    
    // 取出模型
    ILSettingGroup *group = self.dataList[indexPath.section];
    ILSettingItem *item = group.items[indexPath.row];
    
    
    // 传递模型
    cell.item = item;
    cell.indexPath = indexPath;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    ILSettingGroup *group = self.dataList[section];
    return group.header;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    ILSettingGroup *group = self.dataList[section];
    return group.footer;
}
#warning 点击某一行cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 取出模型
    ILSettingGroup *group = self.dataList[indexPath.section];
    ILSettingItem *item = group.items[indexPath.row];
    
    // 执行操作
    if (item.option) {
        item.option();
        return;
    }
    
    if ([item isKindOfClass:[ILSettingArrowItem class]]) { // 需要跳转控制器
        ILSettingArrowItem *arrowItem = (ILSettingArrowItem *)item;
        
        
        // 创建跳转的控制器
        if (arrowItem.destVcClass) {
            
            UIViewController *vc = [[arrowItem.destVcClass alloc] init];
            vc.title = item.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        
    }
    
}


@end
