//
//  ILProductCell.m
//  ItheimaLottery
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ILProductCell.h"

#import "ILProduct.h"

@interface ILProductCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end


@implementation ILProductCell


- (void)awakeFromNib
{
    _imageView.layer.cornerRadius = 10;
    _imageView.clipsToBounds = YES;

}

- (void)setProduct:(ILProduct *)product
{
    _product = product;
    NSLog(@"%@",product.icon);
    UIImage *image = [UIImage imageNamed:@"movie@2x.png"];
    NSLog(@"%@",image);
    _imageView.image = [UIImage imageNamed:product.icon];
    _label.text = product.title;
}

@end
