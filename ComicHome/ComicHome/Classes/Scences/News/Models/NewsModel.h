//
//  NewsModel.h
//  ComicHome
//
//  Created by 高杰 on 16/6/27.
//  Copyright © 2016年 王海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

///标题 ***
@property (nonatomic, strong)NSString *title;

///封面图片 ***
@property (nonatomic, strong)NSString *cover;

///作者名字 ***
@property (nonatomic, strong)NSString *nickname;

///人的 url, 应该是用户的头像图片
@property (nonatomic, strong)NSString *row_pic_url;

///创建时间  1467096613 这个样子的 这个是时间戳, 要转换
@property (nonatomic, strong)NSString *create_time;









///颜色 图案
@property (nonatomic, strong)NSString *col_pic_url;

///空
@property (nonatomic, strong)NSString *from_name;

//空
@property (nonatomic, strong)NSString *from_url;



//是否是国外的
@property (nonatomic, strong)NSString *is_foreign;

///国外的 URL 空
@property (nonatomic, strong)NSString *foreign_url;

//简介
@property (nonatomic, strong)NSString *intro;

///作者 id
@property (nonatomic, strong)NSString *author_id;

///地位 状态 身份 1
@property (nonatomic, strong)NSString *status;





///文章 id
@property (nonatomic, strong)NSString *article_id;

///页码的 url
@property (nonatomic, strong)NSString *page_url;

///作者的 uid
@property (nonatomic, strong)NSString *author_uid;

///人名的数量 不知道什么东西
@property (nonatomic, strong)NSString *mood_amount;

///评论数量
@property (nonatomic, strong)NSString *comment_amount;



@end
