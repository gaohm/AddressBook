//
//  UIImage+HM.m
//  22 图片操作水印截图截屏
//
//  Created by meng on 14-12-24.
//  Copyright (c) 2014年 ghm. All rights reserved.
//

#import "UIImage+HM.h"
#define Kscale 0.2
#define Kregin 5

@implementation UIImage (HM)

/**
 *  图片添加水印
 *
 *  @param Bg   原始图片名称
 *  @param logo 水印
 *
 *  @return UIimage
 */
+ (instancetype)waterImageWithBg:(NSString *)Bg logo:(NSString *)logo
{
    // 0.读取文件
    UIImage *imgBg = [UIImage imageNamed:Bg];
    
    // 1.创建一个基于位图的上下文
    UIGraphicsBeginImageContextWithOptions(imgBg.size, NO, 0.0);
    
    // 2.画出背景
    [imgBg drawInRect:CGRectMake(0, 0, imgBg.size.width, imgBg.size.height)];
    
    // 3.画出水印
    UIImage *imgWater = [UIImage imageNamed:logo];
    CGFloat waterW = imgWater.size.width * Kscale;
    CGFloat waterH = imgWater.size.height *Kscale;
    [imgWater drawInRect:CGRectMake(imgBg.size.width - waterW - Kregin, imgBg.size.height - waterH - Kregin, waterW, waterH)];
    
    // 4.从上下文中获得合并后的图像
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5.结束上下文
    UIGraphicsEndImageContext();
    return newImage;
}

+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    // 0.读取图片
    UIImage *img = [UIImage imageNamed:name];
    
    // 1.创建位图上下文
    UIGraphicsBeginImageContext(img.size);
    //UIGraphicsBeginImageContextWithOptions(img.size, YES, 0.0);
    
    // 2.画背景(圆环)
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextAddArc(ref, img.size.width * 0.5, img.size.height * 0.5, img.size.height *0.5 , 0, M_PI*2, 0);
    [borderColor set];
    CGContextFillPath(ref);
    
    // 3.绘制绘图区域
    CGContextAddArc(ref, img.size.width * 0.5, img.size.height * 0.5, img.size.width *0.5 - borderWidth, 0, M_PI*2, 0);
    CGContextClip(ref);
    
    // 4.添加图片
    [img drawInRect:CGRectMake(0, 0, img.size.width, img.size.height)];

    // 5.取出最终图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6.结束上下文
    UIGraphicsEndImageContext();
    return newImg;
    
}

+ (instancetype)captureWithView:(UIView *)view
{
    // 1.获取图片上下文
    UIGraphicsBeginImageContext(view.frame.size);
    
    // 2.将控制器的layer渲染到上下文中
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return newImg;
}
@end
