//
//  AlertsTableViewCell.h
//  ComicHome
//
//  Created by 高杰 on 16/6/28.
//  Copyright © 2016年 王海. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertsTableViewCell : UITableViewCell

///用户头像
@property (nonatomic, strong)UIImageView *userImageView;

///用户名字
@property (nonatomic, strong)UILabel *userNameLabel;

///时间 label
@property (nonatomic, strong)UILabel *timeLabel;

///文字内容 label
@property (nonatomic, strong)UILabel *alertsLabel;

///图片 label
@property (nonatomic, strong)UIImageView *alertsImageView;

///分享 button
@property (nonatomic, strong)UIButton *shareButton;

//中间竖线
@property (nonatomic, strong)UILabel *segmentationLabel;

///评论 button
@property (nonatomic, strong)UIButton *button;

///评论数 label
@property (nonatomic, strong)UILabel *commentNumberLabel;

@end
