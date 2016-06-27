//
//  UIImage+ScaleToImageView.h
//  ComicHome
//
//  Created by lanou3g on 16/6/25.
//  Copyright © 2016年 王海. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ScaleToImageView)

+ (UIImage *)OriginImage:(UIImage *)image scaleToSize:(CGSize)size;

@end
