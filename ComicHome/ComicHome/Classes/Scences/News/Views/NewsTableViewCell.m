//
//  NewsTableViewCell.m
//  ComicHome
//
//  Created by 高杰 on 16/6/27.
//  Copyright © 2016年 王海. All rights reserved.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 初始化子视图
        [self initLayout];
    }
    return self;
}

- (void)initLayout {
    ///标题图片
    //    @property (nonatomic, strong)UIImageView *titleImageView;
    _titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.contentView.frame) + 10, CGRectGetMinY(self.contentView.frame) + 20, 130, 90)];
//    _titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 55, 130, 90)];
    _titleImageView.backgroundColor = [UIColor cyanColor];
    
    [self.contentView addSubview:_titleImageView];
    //
    //    ///标题 label
    //    @property (nonatomic, strong)UILabel *titleLabel;
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_titleImageView.frame) + 10, CGRectGetMinY(_titleImageView.frame) + 5, 100, 40)];
    _titleLabel.backgroundColor = [UIColor colorWithRed:0.602 green:0.936 blue:1.000 alpha:1.000];
    [self.contentView addSubview:_titleLabel];
    
    //
    //    ///头像 label
    //    @property (nonatomic, strong)UIImageView *headImageView;
    _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_titleImageView.frame) + 10, CGRectGetMaxY(_titleLabel.frame) + 15, 20, 20)];
    _headImageView.backgroundColor = [UIColor colorWithRed:1.000 green:0.489 blue:0.887 alpha:1.000];
    [self.contentView addSubview:_headImageView];
    
    //
    //    ///名字 label
    //    @property (nonatomic, strong)UILabel *nameLabel;
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_headImageView.frame) + 5, CGRectGetMinY(_headImageView.frame) + 2.5, 50, 15)];
    _nameLabel.backgroundColor = [UIColor colorWithRed:0.723 green:1.000 blue:0.070 alpha:1.000];
    [self.contentView addSubview:_nameLabel];
    
    //
    //    ///时间 label
    //    @property (nonatomic, strong)UILabel *timeLabel;
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_nameLabel.frame) + 10, CGRectGetMinY(_headImageView.frame) + 2.5, 60, 14)];
    _timeLabel.backgroundColor = [UIColor colorWithRed:0.786 green:0.513 blue:1.000 alpha:1.000];
    [self.contentView addSubview:_timeLabel];
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
