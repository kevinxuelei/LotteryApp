//
//  ILShareViewController.m
//  ItheimaLottery
//
//  Created by apple on 14-9-12.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ILShareViewController.h"

#import "ILSettingItem.h"

#import "ILSettingArrowItem.h"
#import "ILSettingGroup.h"

#import "UMSocial.h"

#import <MessageUI/MessageUI.h>

@interface ILShareViewController ()<MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate>

@property (nonatomic, assign) int age;

@end

@implementation ILShareViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    // 0组
    [self addGroup0];
    
}

- (void)addGroup0
{
    // 0组
    ILSettingArrowItem *sina = [ILSettingArrowItem itemWithIcon:@"WeiboSina" title:@"新浪分享" ];
    sina.option = ^{
        [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToSina] content:@"分享内嵌文字" image:nil location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
            if (response.responseCode == UMSResponseCodeSuccess) {
                NSLog(@"分享成功！");
            }
        }];

    
    };
    
    ILSettingItem *sms = [ILSettingArrowItem itemWithIcon:@"SmsShare" title:@"短信分享"];
    __weak ILShareViewController *share = self;
    sms.option = ^{
        MFMessageComposeViewController *vc = [[MFMessageComposeViewController alloc] init];
        // 设置短信内容
        vc.body = @"吃饭了没？";
        // 设置收件人列表
        vc.recipients = @[@"10010", @"02010010"];
        // 设置代理
        vc.messageComposeDelegate = share;
       
        share.age;
        // 显示控制器
        [share presentViewController:vc animated:YES completion:nil];

    };
    
    ILSettingItem *mail = [ILSettingArrowItem itemWithIcon:@"MailShare" title:@"邮件分享"];
    mail.option = ^{
        // 不能发邮件
        if (![MFMailComposeViewController canSendMail]) return;
        
        MFMailComposeViewController *vc = [[MFMailComposeViewController alloc] init];
        
        // 设置邮件主题
        [vc setSubject:@"会议"];
        // 设置邮件内容
        [vc setMessageBody:@"今天下午开会吧" isHTML:NO];
        // 设置收件人列表
        [vc setToRecipients:@[@"643055866@qq.com"]];
        // 设置抄送人列表
        [vc setCcRecipients:@[@"1234@qq.com"]];
        // 设置密送人列表
        [vc setBccRecipients:@[@"56789@qq.com"]];
        
        
        // 添加附件（一张图片）
        UIImage *image = [UIImage imageNamed:@"阿狸头像"];
        NSData *data = UIImagePNGRepresentation(image);
        [vc addAttachmentData:data mimeType:@"image/png" fileName:@"阿狸头像.png"];
        // 设置代理
//        vc.mailComposeDelegate = self;
//        // 显示控制器
//        [self presentViewController:vc animated:YES completion:nil];


    
    };
    
    ILSettingGroup *group0 = [[ILSettingGroup alloc] init];
    
    group0.items = @[sina,sms,mail];
    
    [self.dataList addObject:group0];
}

- (void)dealloc
{
    NSLog(@"dealloc");
}


// 当你取消发送短信的时候就会调用
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
