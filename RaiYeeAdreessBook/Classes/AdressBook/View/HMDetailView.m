//
//  HMDetailView.m
//  RaiYeeAdreessBook
//
//  Created by ghm on 15-1-24.
//  Copyright (c) 2015年 HM. All rights reserved.
//

#import "HMDetailView.h"

@implementation HMDetailView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImage  *backImg = [UIImage imageNamed:@"background"];
//        UIImageView *backImgView = [[UIImageView alloc] initWithImage:backImg];
//        [self addSubview:backImgView];
        [self setBackgroundColor:[UIColor colorWithPatternImage:backImg]];
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
