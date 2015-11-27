//
//  ILNavigationController.m
//  ItheimaLottery
//
//  Created by apple on 14-9-9.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ILNavigationController.h"

@interface ILNavigationController ()

@end

@implementation ILNavigationController

// 第一次使用这个类或者这个类的子类的时候
+ (void)initialize
{
    if (self == [ILNavigationController class]) { // 肯定能保证只调用一次
       
        
       // 1.设置全局导航条外观
        [self setupNav];
        
        if (ios7) return; // 不需要设置全局barButton外观
        
        // 2.设置全局barButton外观
        [self setupBarButton];
      
        
    }
}

#warning 设置全局导航条
+ (void)setupNav
{
    // 获取应用程序中所有的导航条
    // 获取所有导航条外观
    // 获取我们自己导航控制器下的导航条
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:[ILNavigationController class], nil];
    
    UIImage *navImage = nil;
    
    if (ios7) {
        navImage = [UIImage imageNamed:@"NavBar64"];
    }else{
        navImage = [UIImage imageNamed:@"NavBar"];
    }
    [bar setBackgroundImage:navImage forBarMetrics:UIBarMetricsDefault];
    
    
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName : [UIColor whiteColor],
                           NSFontAttributeName : [UIFont systemFontOfSize:15]
                           };
    [bar setTitleTextAttributes:dict];
    
    // 设置导航条的主题颜色
    [bar setTintColor:[UIColor whiteColor]];
}


#warning 设置全局的UIBarButton外观
+ (void)setupBarButton
{
    // 获取所有UIBarButton的外观
    UIBarButtonItem *buttonItem = [UIBarButtonItem appearance];
    // 设置UIBarButton的背景图片
    [buttonItem setBackgroundImage:[UIImage imageNamed:@"NavButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [buttonItem setBackgroundImage:[UIImage imageNamed:@"NavButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    // 设置返回按钮的背景图片
    [buttonItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [buttonItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%s",__func__);

}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    
    return [super pushViewController:viewController animated:animated];
}

@end
