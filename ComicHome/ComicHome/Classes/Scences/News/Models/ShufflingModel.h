//
//  ShufflingModel.h
//  ComicHome
//
//  Created by 高杰 on 16/6/28.
//  Copyright © 2016年 王海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShufflingModel : NSObject

//轮播图 model
@property (nonatomic, strong) NSString *Id;

@property (nonatomic, assign) NSInteger object_id;


@property (nonatomic, strong) NSString *object_url;

@property (nonatomic, strong) NSString *pic_url;

@property (nonatomic, strong) NSString *title;

@end
