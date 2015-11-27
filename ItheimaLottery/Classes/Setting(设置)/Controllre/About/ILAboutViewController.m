//
//  ILAboutViewController.m
//  ItheimaLottery
//
//  Created by apple on 14-9-12.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ILAboutViewController.h"

#import "ILSettingItem.h"

#import "ILSettingArrowItem.h"
#import "ILSettingGroup.h"

#import "ILAboutHeaderView.h"

@interface ILAboutViewController ()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation ILAboutViewController

- (UIWebView *)webView
{
    if (_webView == nil) {
        
        _webView = [[UIWebView alloc] init];
        
    }
    return _webView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 0组
    [self addGroup0];
    
    self.tableView.tableHeaderView = [ILAboutHeaderView headerView];
    
}

- (void)addGroup0
{
    
    // 0组
    ILSettingArrowItem *score = [ILSettingArrowItem itemWithIcon:nil title:@"评分支持" destVcClass:nil];
    score.option = ^{
        // 评分
        NSString *appid = @"635768442";
        NSString *str = [NSString stringWithFormat:
                         @"itms-apps://itunes.apple.com/cn/app/id%@?mt=8", appid];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];

    
    };
    
    
    ILSettingItem *tel = [ILSettingArrowItem itemWithIcon:nil title:@"客服电话"];
    tel.subTitle = @"020-83568090";
    tel.option = ^{
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"tel://10010"]]];

    };
    
    ILSettingGroup *group0 = [[ILSettingGroup alloc] init];
    group0.items = @[score,tel];
    
    [self.dataList addObject:group0];
    
}


@end
