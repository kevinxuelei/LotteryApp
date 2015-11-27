//
//  ILSettingLabelItem.m
//  ItheimaLottery
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ILSettingLabelItem.h"

#import "ILSaveTool.h"

@implementation ILSettingLabelItem

- (void)setText:(NSString *)text
{
    _text = text;
    
    [ILSaveTool setObject:text forKey:self.title];
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    _text = [ILSaveTool objectForKey:self.title];
}

@end
