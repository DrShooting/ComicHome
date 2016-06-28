//
//  NewsView.h
//  ComicHome
//
//  Created by 高杰 on 16/6/27.
//  Copyright © 2016年 王海. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsView : UIView
@property (nonatomic, strong) UITableView  *tableView;

///标题图片
@property (nonatomic, strong)UIImageView *titleImageView;

///标题 label
@property (nonatomic, strong)UILabel *titleLabel;

///头像 label
@property (nonatomic, strong)UIImageView *headImageView;

///名字 label
@property (nonatomic, strong)UILabel *nameLabel;

///时间 label
@property (nonatomic, strong)UILabel *timeLabel;






@end
