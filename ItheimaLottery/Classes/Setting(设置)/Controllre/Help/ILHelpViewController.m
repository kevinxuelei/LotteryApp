//
//  ILHelpViewController.m
//  ItheimaLottery
//
//  Created by apple on 14-9-12.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ILHelpViewController.h"


#import "ILSettingCell.h"

#import "ILSettingItem.h"

#import "ILSettingArrowItem.h"
#import "ILSettingSwitchItem.h"

#import "ILSettingGroup.h"

#import "ILHtml.h"

#import "ILHtmlViewController.h"

#import "ILNavigationController.h"

@interface ILHelpViewController ()
@property (nonatomic, strong) NSMutableArray *htmls;
@end

@implementation ILHelpViewController

- (NSMutableArray *)htmls
{
    if (_htmls == nil) {
        _htmls = [NSMutableArray array];
        
        
        NSString *fileName = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        NSData *data =  [NSData dataWithContentsOfFile:fileName];
        
        NSArray *jsonArr =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        for (NSDictionary *dict in jsonArr) {
            ILHtml *html = [ILHtml htmlWithDict:dict];
            [_htmls addObject:html];
        }
    }
    return _htmls;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 0组
    [self addGroup0];
    
}

- (void)addGroup0
{

    // 0组
    NSMutableArray *items = [NSMutableArray array];
    for (ILHtml *html in self.htmls) {
        ILSettingArrowItem *item = [ILSettingArrowItem itemWithIcon:nil title:html.title destVcClass:nil];
        [items addObject:item];
    }
  
    
    ILSettingGroup *group0 = [[ILSettingGroup alloc] init];
    group0.items = items;
    
    [self.dataList addObject:group0];
    
}


// 重写tableView的点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取出每一行对应的Html模型
    ILHtml *html = self.htmls[indexPath.row];
    
    ILHtmlViewController *htmlVc = [[ILHtmlViewController alloc] init];
    htmlVc.title = html.title;
    htmlVc.html = html;
    
    ILNavigationController *nav = [[ILNavigationController alloc] initWithRootViewController:htmlVc];
    
    [self presentViewController:nav animated:YES completion:nil];
}

@end
