//
//  HMMember.m
//  RaiYeeAdreessBook
//
//  Created by ghm on 15-1-21.
//  Copyright (c) 2015年 HM. All rights reserved.
//

#import "HMMember.h"

@implementation HMMember

+ (instancetype)initWithDict:(NSDictionary *)dict
{
    return [[self  alloc] initWithDict:dict];
}

/**
 *  初始化模型（对象方法）
 *
 *  @param dict 传入字典模型
 *
 *  @return 返回为模型数据
 */
- (instancetype)initWithDict:(NSDictionary *)dict {
    if(self = [super init]) {
        // 字典数据与模型数据完全一致时，可采用的方式
        [self setValuesForKeysWithDictionary:dict];
    }
    return  self;
}

@end
