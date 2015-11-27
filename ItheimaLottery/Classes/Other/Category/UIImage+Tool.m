//
//  UIImage+Tool.m
//  ItheimaLottery
//
//  Created by apple on 14-9-9.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "UIImage+Tool.h"

@implementation UIImage (Tool)

+ (instancetype)imageWithResizableImageName:(NSString *)imageName 
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    image =  [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
    return image;
}

@end
