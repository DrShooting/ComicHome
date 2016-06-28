//
//  ShufflingModel.m
//  ComicHome
//
//  Created by 高杰 on 16/6/28.
//  Copyright © 2016年 王海. All rights reserved.
//

#import "ShufflingModel.h"

@implementation ShufflingModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"Id"];
    }
}


@end
