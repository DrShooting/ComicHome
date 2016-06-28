//
//  NewsModel.m
//  ComicHome
//
//  Created by 高杰 on 16/6/27.
//  Copyright © 2016年 王海. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"Id"];
    }
}

@end
