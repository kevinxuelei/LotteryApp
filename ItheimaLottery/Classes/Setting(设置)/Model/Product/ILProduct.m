//
//  ILProduct.m
//  ItheimaLottery
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ILProduct.h"

@implementation ILProduct

+ (instancetype)productWithDict:(NSDictionary *)dict{
    ILProduct *product = [[ILProduct alloc] init];
    
    product.title = dict[@"title"];
    product.icon = dict[@"icon"];
    product.url = dict[@"url"];
    product.customUrl = dict[@"customUrl"];
    product.ID = dict[@"id"];
    
    return product;
}

- (void)setIcon:(NSString *)icon
{
    _icon = [icon stringByReplacingOccurrencesOfString:@"@2x.png" withString:@""];
    
    
}

@end
