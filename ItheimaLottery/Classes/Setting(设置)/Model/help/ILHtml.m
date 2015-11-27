//
//  ILHtml.m
//  ItheimaLottery
//
//  Created by apple on 14-9-12.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ILHtml.h"

@implementation ILHtml


+ (instancetype)htmlWithDict:(NSDictionary *)dict
{
    ILHtml *html = [[ILHtml alloc] init];
    
    html.title = dict[@"title"];
    html.html = dict[@"html"];
    html.ID = dict[@"id"];
    return html;
}

@end
