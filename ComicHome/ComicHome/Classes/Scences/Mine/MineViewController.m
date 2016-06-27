//
//  MineViewController.m
//  ComicHome
//
//  Created by lanou3g on 16/6/24.
//  Copyright © 2016年 王海. All rights reserved.
//

#import "MineViewController.h"
// 宏
#import "EfficientDefine.h"
// 可伸缩模糊的头像视图
#import "UIScrollView+TwitterCover.h"
// image适应imageView的类目
#import "UIImage+ScaleToImageView.h"

// 头像背景视图显示的图片
#define kHeaderBackgroundImage @"headerBackgroundImage.jpg"

/**
 *  segment
 */
// segment上方间隙
#define kSegmentTopSpace 10
// segment左右边间隙
#define kSegmentLeftAndRightSpace 10
// segment的位置
#define kSegmentLocationX kSegmentTopSpace
#define kSegmentLocationY (CHTwitterCoverViewHeight + kSegmentTopSpace)
#define kSegmentSizeWidth (SCREEN_WIDTH - 2 * kSegmentLeftAndRightSpace)
#define kSegmentSizeHeight 30
// segment的items
#define kSegmentItems @[@"我的漫画", @"我的小说"]

/**
 *  CANTableView
 */
// CANTableView的上方间隙
#define kCANTableViewTopSpace kSegmentTopSpace
// CANTableView的左右间隙
#define kCANTableViewLeftAndRightSpace 0
// CANTableView的位置
#define kCANTableViewLocationX 0
#define kCANTableViewLocationY (CHTwitterCoverViewHeight + kSegmentTopSpace + kSegmentSizeHeight + kCANTableViewTopSpace)
// CANTableView的大小
#define kCANTableViewSizeWidth SCREEN_WIDTH
#define kCANTableViewSizeHeight (kCellHeight * 4)
// CANTableView的frame
#define kCANTableViewFrame CGRectMake(kCANTableViewLocationX, kCANTableViewLocationY, kCANTableViewSizeWidth, kCANTableViewSizeHeight)

/**
 *  cell
 */
// cell的高度
#define kCellHeight 44
// tableView的重用标识
#define kIdentifierOfUITableViewCell @"UITableViewCell"

/**
 *  tableView
 */
// tableView的数组
#define kTableViewComicDataArray @[@"漫画订阅", @"浏览记录", @"漫画下载", @"漫画评论"]
#define kTableViewNorvelDataArray @[@"小说订阅", @"浏览记录", @"小说下载", @"小说评论"]

/**
 *  本地图片
 */
// 订阅
#define kSubscription @"Subscription"
// 浏览记录
#define kHistory @"History"
// 下载
#define kDownload @"Download"
// 评论
#define kComment @"Comment"
// 组成数组
#define kIconImageArray @[kSubscription, kHistory, kDownload, kComment]


@interface MineViewController ()<UITableViewDelegate, UITableViewDataSource>

/// 背景滚动视图
@property (nonatomic, strong) UIScrollView *backgroundScrollView;
/// 头像imageView
@property (nonatomic, strong) UIImageView *headerImageView;
/// segment
@property (nonatomic, strong) UISegmentedControl *segmentControl;
/// 漫画和小说的tableView(comic and norvel)
@property (nonatomic, strong) UITableView *CANTableView;
/// tableView的数组
@property (nonatomic, strong) NSArray *tableViewDataArray;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化背景滚动视图
    [self initBackgroundScrollView];
    // 初始化segment
    [self initSegment];
    // 初始化CANTableView
    [self initCANTableView];
}

#pragma mark - 初始化背景滚动视图
- (void)initBackgroundScrollView {
    // 初始化, 大小与控制器view一样
    self.backgroundScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    // 添加到父视图
    [self.view addSubview:self.backgroundScrollView];
    // 设置滚动范围
    self.backgroundScrollView.contentSize = self.view.frame.size;
    // 设置垂直方向回弹
    self.backgroundScrollView.alwaysBounceVertical = YES;
    // 设置可伸缩模糊的背景图片
    [self.backgroundScrollView addTwitterCoverWithImage:[UIImage imageNamed:kHeaderBackgroundImage]];
}

#pragma mark - viewWillAppear
- (void)viewWillAppear:(BOOL)animated {
    // 设置导航栏
    [self setNavigationBar];
    // 背景颜色
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

#pragma mark - 设置导航栏
- (void)setNavigationBar {
    // 隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES];
    // 取消自动布局设置(scrollView)
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 滚动时隐藏
//    self.navigationController.hidesBarsOnSwipe =YES;
}

#pragma mark - 初始化segment
- (void)initSegment {
    // 创建segmentControl对象
    self.segmentControl = [[UISegmentedControl alloc] initWithItems:kSegmentItems];
    // 设置frame
    self.segmentControl.frame = CGRectMake(kSegmentLocationX, kSegmentLocationY, kSegmentSizeWidth, kSegmentSizeHeight);
    // 添加到父视图
    [self.backgroundScrollView addSubview:self.segmentControl];
    // 添加点击事件
    [self.segmentControl addTarget:self action:@selector(segmentControlAction:) forControlEvents:UIControlEventValueChanged];
    // 默认选中"我的漫画"
    self.segmentControl.selectedSegmentIndex = 0;
    // 选择一开始显示那个数据源
    [self reloadTableViewWithSegmentIndex:0];
}
#pragma mark - segmentControl的点击事件
- (void)segmentControlAction:(UISegmentedControl *)sender {
    // 获取响应的下标
    NSInteger index = sender.selectedSegmentIndex;
    // 根据segment下标刷新tableView
    [self reloadTableViewWithSegmentIndex:index];
}
#pragma mark - 根据segment下标刷新tableView
- (void)reloadTableViewWithSegmentIndex:(NSInteger)index {
    // 判断响应的下标
    switch (index) {
        case 0:
            self.tableViewDataArray = kTableViewComicDataArray;
            [self.CANTableView reloadData];
            break;
        case 1:
            self.tableViewDataArray = kTableViewNorvelDataArray;
            [self.CANTableView reloadData];
            break;
        default:
            NSLog(@"未知情形");
            break;
    }

}

#pragma mark - 初始化CANTableView
- (void)initCANTableView {
    // 创建对象
    self.CANTableView = [[UITableView alloc] initWithFrame:kCANTableViewFrame style:UITableViewStylePlain];
    // 添加到父视图
    [self.backgroundScrollView addSubview:self.CANTableView];
    // 设置代理
    self.CANTableView.dataSource = self;
    self.CANTableView.delegate = self;
    // 注册cell
    [self.CANTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kIdentifierOfUITableViewCell];
    
    
    
    
    
    
    
    
    
}

#pragma mark - tableView代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableViewDataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.CANTableView dequeueReusableCellWithIdentifier:kIdentifierOfUITableViewCell forIndexPath:indexPath];
    cell.textLabel.text = self.tableViewDataArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:17];
    cell.imageView.frame = CGRectMake(0, 0, 30, 30);
    cell.imageView.image = [UIImage OriginImage:[UIImage imageNamed:kIconImageArray[indexPath.row]] scaleToSize:cell.imageView.frame.size];
    // 隐藏最后一行分割线
    if (indexPath.row == 3) {
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, cell.bounds.size.width - 15);
    }
    return cell;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
