//
//  ILTabBarViewController.m
//  ItheimaLottery
//
//  Created by apple on 14-9-9.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ILTabBarViewController.h"

#import "ILTabBar.h"



@interface ILTabBarViewController ()<ILTabBarDelegate>

@end

@implementation ILTabBarViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    // 创建tabBar
    ILTabBar *tabBar = [[ILTabBar alloc] init];
    
    tabBar.delegate = self;
    
    tabBar.frame = self.tabBar.bounds;
    
    // 因为系统自动隐藏的是系统自带的tabBar
    [self.tabBar addSubview:tabBar];
    
    NSString *imageName = nil;
    
    NSString *selImageName = nil;
    
    for (int i = 0; i < self.childViewControllers.count; i++) {
        
        imageName = [NSString stringWithFormat:@"TabBar%d",i + 1];
        selImageName = [NSString stringWithFormat:@"TabBar%dSel",i + 1];

        // 添加底部按钮
        [tabBar addTabBarButtonWithName:imageName selName:selImageName];
    
    }


   
    
    
    
   
}

// 代理方法：跳转控制器
- (void)tabBar:(ILTabBar *)tabBar didSelectedIndex:(int)index
{
    self.selectedIndex = index;
}



@end
