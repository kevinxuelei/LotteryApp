//
//  ILSettingTableViewController.m
//  ItheimaLottery
//
//  Created by apple on 14-9-9.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ILSettingTableViewController.h"

#import "ILSettingCell.h"

#import "ILSettingItem.h"

#import "ILSettingArrowItem.h"
#import "ILSettingSwitchItem.h"

#import "ILSettingGroup.h"

#import "ILTestViewController.h"

#import "MBProgressHUD+MJ.h"

#import "ILProductViewController.h"

#import "ILPushNoticeController.h"

#import "ILHelpViewController.h"

#import "ILShareViewController.h"

#import "ILAboutViewController.h"

@interface ILSettingTableViewController ()


@end

@implementation ILSettingTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 0组
    [self addGroup0];
    
    // 1组
    [self addGroup1];
}
- (void)addGroup1
{
    // 1组
    ILSettingItem *newVersion = [ILSettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
    // 保存了一段检查更新的功能
    newVersion.option = ^{
        // 1.显示蒙板
        [MBProgressHUD showMessage:@"正在检查ing......."];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 2.隐藏蒙板
            [MBProgressHUD hideHUD];
            
            // 3.提示用户
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"有更新版本" message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"立即更新", nil];
            // 显示UIAlertView
            [alert show];
            
        });
        
        
    };
    ILSettingItem *help = [ILSettingArrowItem itemWithIcon:@"MoreHelp" title:@"帮助" destVcClass:[ILHelpViewController class]];
    
    ILSettingItem *MoreShare = [ILSettingArrowItem itemWithIcon:@"MoreShare" title:@"分享" destVcClass:[ILShareViewController class]];
    ILSettingItem *MoreMessage = [ILSettingArrowItem itemWithIcon:@"MoreMessage" title:@"查看消息" destVcClass:[ILTestViewController class]];
    ILSettingItem *MoreNetease = [ILSettingArrowItem itemWithIcon:@"MoreNetease" title:@"产品推荐" destVcClass:[ILProductViewController class]];
    ILSettingItem *MoreAbout = [ILSettingArrowItem itemWithIcon:@"MoreAbout" title:@"关于" destVcClass:[ILAboutViewController class]];
    
    ILSettingGroup *group1 = [[ILSettingGroup alloc] init];

    group1.items = @[newVersion,help,MoreShare,MoreMessage,MoreNetease,MoreAbout];
    

    [self.dataList addObject:group1];
}

- (void)addGroup0
{
    // 0组
    ILSettingArrowItem *pushNotice = [ILSettingArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒" destVcClass:[ILPushNoticeController class]];
    
    
    ILSettingItem *yaoyiyao = [ILSettingSwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选"];
    
    ILSettingItem *sound = [ILSettingSwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果"];
    
    
    ILSettingGroup *group0 = [[ILSettingGroup alloc] init];
    group0.items = @[pushNotice,yaoyiyao,sound];
    
    [self.dataList addObject:group0];
}

@end
