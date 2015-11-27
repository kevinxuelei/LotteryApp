//
//  ILSettingArrowItem.m
//  ItheimaLottery
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ILSettingArrowItem.h"

@implementation ILSettingArrowItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass
{
    ILSettingArrowItem *item = [super itemWithIcon:icon title:title];
    item.destVcClass = destVcClass;
    
    return item;
}

@end
