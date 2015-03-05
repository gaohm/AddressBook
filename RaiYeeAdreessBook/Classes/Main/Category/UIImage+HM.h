//
//  UIImage+HM.h
//  22 图片操作水印截图截屏
//
//  Created by meng on 14-12-24.
//  Copyright (c) 2014年 ghm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HM)

/**
 *  图片添加水印
 *
 *  @param Bg   原始图片名称
 *  @param logo 水印
 *
 *  @return UIimage
 */
+ (instancetype)waterImageWithBg:(NSString *)Bg logo:(NSString *)logo;

/**
 *  裁切圆形图线
 *
 *  @param name        文件路径
 *  @param borderWidth 圆环边距
 *  @param borderColor 圆环颜色
 *
 *  @return
 */
+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 *  截屏程序
 *
 *  @param view 需要截取的view
 *
 *  @return 
 */
+ (instancetype)captureWithView:(UIView *)view;

@end
