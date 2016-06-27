//
//  UIImage+ScaleToImageView.m
//  ComicHome
//
//  Created by lanou3g on 16/6/25.
//  Copyright © 2016年 王海. All rights reserved.
//

#import "UIImage+ScaleToImageView.h"

@implementation UIImage (ScaleToImageView)

+ (UIImage *)OriginImage:(UIImage *)image scaleToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end
