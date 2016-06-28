//
//  NetWorkRequestManager.h
//  MusicPlayer
//
//  Created by lanou3g on 16/6/13.
//  Copyright © 2016年 王海. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

// 1. 类型的枚举 GET POST
// RequestType {GET POST}
// 项目开发中, 当需要实现某些固定类型选择的需求时使用枚举
typedef NS_ENUM(NSUInteger, RequestType) {
    GET,
    POST,
};

// 2. 成功和失败的回调 block
// 当我们开辟了子线程做了一些事情的时候, 我们就需要使用block来传值(代理, 通知都可以(使用通知需要耦合性比较低))
typedef void(^RequestSuccessed)(id data);
typedef void(^RequestFaild)(NSError *error);

@interface NetWorkRequestManager : NSObject

// 单例
//+ (instancetype)shareNetWorkRequestManager;
singleton_interface(NetWorkRequestManager)

// 3. 接口 调用
+ (void)requestType:(RequestType)type
          urlString:(NSString *)urlString
              prama:(NSDictionary *)pramas // POST请求使用, GET可以传nil
            success:(RequestSuccessed)success
               fail:(RequestFaild)fail;

// 预留


@end
