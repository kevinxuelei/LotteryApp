//
//  ILLoginViewController.m
//  ItheimaLottery
//
//  Created by apple on 14-9-9.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ILLoginViewController.h"

#import "UIImage+Tool.h"

#import "ILSettingTableViewController.h"

@interface ILLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation ILLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)setting:(id)sender {
    
    // 创建设置口控制器
    ILSettingTableViewController *settingVc = [[ILSettingTableViewController alloc] init];
    
    // 跳转到设置界面
    [self.navigationController pushViewController:settingVc animated:YES];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置登录按钮的拉伸好的图片
    [_loginBtn setBackgroundImage:[UIImage imageWithResizableImageName:@"RedButton"] forState:UIControlStateNormal];
    
    [_loginBtn setBackgroundImage:[UIImage imageWithResizableImageName:@"RedButtonPressed"] forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
