//
//  HMMember.h
//  RaiYeeAdreessBook
//
//  Created by ghm on 15-1-21.
//  Copyright (c) 2015年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMMember : NSObject

@property (nonatomic,strong) NSString *department;
@property (nonatomic,strong) NSString *eMail;
@property (nonatomic,strong) NSString *employeeID;
@property (nonatomic,strong) NSString *enName;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *position;
@property (nonatomic,strong) NSString *sex;
@property (nonatomic,strong) NSString *telNum;
@property (nonatomic,strong) NSString *telNum1;
@property (nonatomic,strong) NSString *weixinNum;

- (instancetype) initWithDict:(NSDictionary *)dict;
+ (instancetype) initWithDict:(NSDictionary *)dict;

@end
