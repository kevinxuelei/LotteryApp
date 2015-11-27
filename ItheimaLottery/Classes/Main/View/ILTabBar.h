//
//  ILTabBar.h
//  ItheimaLottery
//
//  Created by apple on 14-9-9.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
// block作用：保存一段代码，到恰当的时候再去调用

// 如果需要传参数给其他对象，block才需要定义参数
//typedef void(^ILTabBarBlock)(int selectedIndex);

@class ILTabBar;

@protocol ILTabBarDelegate <NSObject>

@optional
- (void)tabBar:(ILTabBar *)tabBar didSelectedIndex:(int)index;

@end

@interface ILTabBar : UIView

//// 相当于小弟
//@property (nonatomic, copy) ILTabBarBlock block;

@property (nonatomic, weak) id<ILTabBarDelegate> delegate;

// 给外界创建按钮
- (void)addTabBarButtonWithName:(NSString *)name selName:(NSString *)selName;


@end
