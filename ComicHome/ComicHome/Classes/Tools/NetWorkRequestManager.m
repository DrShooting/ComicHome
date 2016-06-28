//
//  NetWorkRequestManager.m
//  MusicPlayer
//
//  Created by lanou3g on 16/6/13.
//  Copyright © 2016年 王海. All rights reserved.
//

#import "NetWorkRequestManager.h"

@implementation NetWorkRequestManager

singleton_implementation(NetWorkRequestManager)

+ (void)requestType:(RequestType)type
          urlString:(NSString *)urlString
              prama:(NSDictionary *)pramas
            success:(RequestSuccessed)success
               fail:(RequestFaild)fail {
    
    NetWorkRequestManager *manager = [NetWorkRequestManager shareNetWorkRequestManager];
    // 转到对象方法进行实现, 因为self不能用啊
    [manager requestWithType:type urlString:urlString prama:pramas success:success fail:fail];
}

- (void)requestWithType:(RequestType)type
              urlString:(NSString *)urlString
                  prama:(NSDictionary *)pramas
                success:(RequestSuccessed)success
                   fail:(RequestFaild)fail {

    // 1. 使用urlSession
    NSURLSession *session = [NSURLSession sharedSession];
    // 2. 准备url
    NSURL *url = [NSURL URLWithString:urlString];
    // 3. 设置request对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 判断请求类型
    if (type == POST) {
        // 设置请求方法
        request.HTTPMethod = @"POST";
        // 判断字典是否为空(参数是否传过来了)
        if (pramas.count > 0) {
            // post参数需要加进body里面, 将字典中的内容转成符合 key=value&key=value 的形式
            [request setHTTPBody:[self parDicToDataWithDic:pramas]];
        }
    }
    // 连接发送请求
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data && !error) {
            // 当调用block之前必须确认block实现了, 否则会崩溃
            if (success) {
                success(data);
            }
        } else {
            if (!data) {
                NSLog(@"请求数据为空");
            }
            if (error) {
                if (fail) {
                    fail(error);
                }
            }
        }
    }];
    [task resume];
}

- (NSData *)parDicToDataWithDic:(NSDictionary *)dic {
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    // 遍历字典中所有的key和value (数组中也要类似方法)
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [arr addObject:[NSString stringWithFormat:@"%@=%@", key, obj]];
    }];
    // 使用&进行数组中元素的拼接
    NSString *parString = [arr componentsJoinedByString:@"&"];
    return [parString dataUsingEncoding:NSUTF8StringEncoding];
}



@end
