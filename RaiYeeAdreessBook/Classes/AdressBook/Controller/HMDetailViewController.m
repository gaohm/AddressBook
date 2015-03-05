//
//  HMDetailViewController.m
//  RaiYeeAdreessBook
//
//  Created by ghm on 15-1-24.
//  Copyright (c) 2015年 HM. All rights reserved.
//

#import "HMDetailViewController.h"
#import "HMDetailView.h"
#import "HMMember.h"

#define kHightUserImage 50
#define kHightUserImage 50

typedef NS_ENUM(NSInteger, HMAddressSendControlStatue) {
    HMAddressSendControlStatueTelphone = 0,
    HMAddressSendControlStatueMessage  = 1,
    HMAddressSendControlStatueEmail    = 2,
};

@interface HMDetailViewController ()

@end

@implementation HMDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}   

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HMDetailView *detailView = [[HMDetailView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:detailView];
    
    UIImage *userImg = [UIImage circleImageWithName:@"txl" borderWidth:5 borderColor:[UIColor whiteColor]];
    UIImageView *userImgView = [[UIImageView alloc] initWithImage:userImg];
    userImgView.frame = CGRectMake(320/2-25, 100, 50, 50);
    [self.view addSubview:userImgView];
    
    UILabel *nameLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 80, 250, 300)];
    nameLab.numberOfLines = 0;
    nameLab.text = [NSString stringWithFormat:@"姓名：%@\r英文：%@\r性别：%@\r职位：%@\r电话：%@\r邮箱：%@",self.member.name,self.member.enName, self.member.sex,self.member.position,self.member.telNum,self.member.eMail];
    [self.view addSubview:nameLab];
    
    [self addButtonSend:CGPointMake(320/4.f - 15, 400) tag:HMAddressSendControlStatueTelphone image:@"tel"];
    [self addButtonSend:CGPointMake(2*320/4.f - 15, 400) tag:HMAddressSendControlStatueMessage image:@"msg"];
    [self addButtonSend:CGPointMake(3*320/4.f - 15, 400) tag:HMAddressSendControlStatueEmail image:@"mail"];
}

- (void)addButtonSend:(CGPoint)point tag:(NSInteger)tag image:(NSString *) img {
    UIButton *sendBtn = [[UIButton alloc] initWithFrame:CGRectMake(point.x, point.y, 30, 30)];
    sendBtn.tag = tag;
    [sendBtn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [sendBtn addTarget:self action:@selector(send:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:sendBtn];
}

- (void)send:(UIButton *)btn {
    switch (btn.tag) {
        case HMAddressSendControlStatueTelphone:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",self.member.telNum]]];
            break;
         case HMAddressSendControlStatueMessage:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms://%@",self.member.telNum]]];
            break;
        case HMAddressSendControlStatueEmail:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto://%@",self.member.eMail]]];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
