//
//  ILPushNoticeController.m
//  ItheimaLottery
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ILPushNoticeController.h"

#import "ILSettingCell.h"

#import "ILSettingItem.h"

#import "ILSettingArrowItem.h"
#import "ILSettingSwitchItem.h"

#import "ILSettingGroup.h"

#import "ILScoreNoticeViewController.h"

@interface ILPushNoticeController ()

@property (nonatomic, strong) NSMutableArray *dataList;

@end

@implementation ILPushNoticeController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 0组
    [self addGroup0];
    
}

- (void)addGroup0
{
    
    // 0组
    ILSettingArrowItem *push = [ILSettingArrowItem itemWithIcon:nil title:@"开奖号码推送" destVcClass:nil];
    
    
    ILSettingItem *anim = [ILSettingArrowItem itemWithIcon:nil title:@"中奖动画"];
    
    ILSettingItem *score = [ILSettingArrowItem itemWithIcon:nil title:@"比分直播" destVcClass:[ILScoreNoticeViewController class]];
    ILSettingItem *timer = [ILSettingArrowItem itemWithIcon:nil title:@"购彩定时提醒"];
    
    ILSettingGroup *group0 = [[ILSettingGroup alloc] init];
    group0.items = @[push,anim,score,timer];
    
    [self.dataList addObject:group0];

}

@end
