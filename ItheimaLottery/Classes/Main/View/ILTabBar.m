//
//  ILTabBar.m
//  ItheimaLottery
//
//  Created by apple on 14-9-9.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ILTabBar.h" 

#import "ILTabBarButton.h"

@interface ILTabBar()

@property (nonatomic, weak) UIButton *selectedButton;

@end

@implementation ILTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

// 提供一个方法给外界添加按钮
- (void)addTabBarButtonWithName:(NSString *)name selName:(NSString *)selName
{
    // 创建按钮
    ILTabBarButton *btn = [ILTabBarButton buttonWithType:UIButtonTypeCustom];

    
    // 设置按钮的图片
    [btn setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    
    [btn setBackgroundImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
    
    // 监听按钮的点击
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:btn];
    
}


// 点击按钮的时候调用
- (void)btnClick:(UIButton *)button
{
    // 取消之前选择按钮
    _selectedButton.selected = NO;
    // 选中当前按钮
    button.selected = YES;
    // 记录当前选中按钮
    _selectedButton = button;
    
    // 切换控制器
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectedIndex:)]) {
        [_delegate tabBar:self didSelectedIndex:button.tag];
    }
   
}

#warning 设置按钮的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat btnW = self.bounds.size.width / self.subviews.count;
    CGFloat btnH = self.bounds.size.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    // 设置按钮的尺寸
    for (int i = 0; i < self.subviews.count; i++) {
        UIButton *btn = self.subviews[i];
        
        // 绑定角标
        btn.tag = i;
        
        btnX = i * btnW;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        // 默认选中第一个按钮
        if (i == 0) {
            [self btnClick:btn];
        }
    }
    
 
    
   

}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
