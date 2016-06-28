//
//  AlertsTableViewCell.m
//  ComicHome
//
//  Created by 高杰 on 16/6/28.
//  Copyright © 2016年 王海. All rights reserved.
//

#import "AlertsTableViewCell.h"

@implementation AlertsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 初始化子视图
        [self initLayout];
    }
    return self;
}

- (void)initLayout {
    //用户头像
    //@property (nonatomic, strong)UIImageView *userImageView;
    _userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 50, 50)];
    _userImageView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_userImageView];
    
    ///用户名字
    //@property (nonatomic, strong)UILabel *userNameLabel;
    
    ///时间 label
    //@property (nonatomic, strong)UILabel *timeLabel;
    
    ///文字内容 label
    //@property (nonatomic, strong)UILabel *alertsLabel;
    
    ///图片 label
    //@property (nonatomic, strong)UIImageView *alertsImageView;
    
    ///分享 button
    //@property (nonatomic, strong)UIButton *shareButton;
    
    //中间竖线
    //@property (nonatomic, strong)UILabel *segmentationLabel;
    
    ///评论 button
    //@property (nonatomic, strong)UIButton *button;
    
    ///评论数 label
    //@property (nonatomic, strong)UILabel *commentNumberLabel;

}










- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
