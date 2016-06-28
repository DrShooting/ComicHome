//
//  NewssViewController.m
//  ComicHome
//
//  Created by 高杰 on 16/6/28.
//  Copyright © 2016年 王海. All rights reserved.
//

#import "NewssViewController.h"
#import "NewsTableViewCell.h"
#import "MyScrollView.h"
#import "NewsTableViewCell.h"
#import "AlertsTableViewCell.h"
#import "NetWorkRequestManager.h"
#import "NewsModel.h"
#import "CH_URL.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImage+ScaleToImageView.h"


//网络请求, model 的问题
@interface NewssViewController ()<UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, strong)UITableView *tableView;

//数据源
@property (nonatomic, strong)NSMutableArray *allDataArray;

//view 属性
@property (nonatomic, strong)UIView *myView;


//存放图片的数组
@property (nonatomic, strong)NSMutableArray *imageNames;

//分段选择控制器属性
@property (nonatomic, strong)UISegmentedControl *piecewiseSC;

//model
@property (nonatomic, strong)NewsModel *newsModel;

@end

@implementation NewssViewController

//- (UISegmentedControl *)piecewiseSC {
//    if (_piecewiseSC == nil) {
//        NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"新闻",@"快讯",nil];
//
//        _piecewiseSC = [[UISegmentedControl alloc] initWithItems:segmentedArray];
//    }
//    return _piecewiseSC;
//}


- (void)viewDidLoad {
    [super viewDidLoad];

    //解析数据
    [self requestData];
    
    //初始化两个属性
    _allDataArray = [NSMutableArray array];
    
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:(UITableViewStyleGrouped)];
    
    //初始化分段选择控制器
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"新闻",@"快讯",nil];
    
    _piecewiseSC = [[UISegmentedControl alloc] initWithItems:segmentedArray];
    
    //添加到视图
    [self.view addSubview:_tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [_tableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:@"newsCell"];
    self.newsModel = [[NewsModel alloc] init];

    
    
}


//解析数据
- (void)requestData {
    __weak typeof(self)weakSelf = self;
    [NetWorkRequestManager requestType:GET urlString:CH_URL_NEWS prama:nil success:^(id data) {
        weakSelf.allDataArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        

        for (NSDictionary *dict in weakSelf.allDataArray) {
            
            [weakSelf.newsModel setValuesForKeysWithDictionary:dict];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //            // 刷新页面
            //            // 隐藏
            //            [weakSelf hideGifView];
            
        });
    } fail:^(NSError *error) {
        NSLog(@"请求数据失败");
    }];
    
}


// 懒加载, 布局写到 if 里面去
- (UIView *)myView {
    
    if (_myView == nil) {
        _myView = [[UIView alloc] init];
        NSLog(@"fa");
        self.imageNames = [NSMutableArray arrayWithObjects:
                           @"1.png",
                           @"h2.jpeg",
                           @"h3.jpeg",
                           @"h4.jpeg",
                           @"h5.jpeg",
                           @"h6.jpeg",
                           @"h7.jpeg",
                           @"h8.jpeg", nil];
        
        MyScrollView *myScrollView = [[MyScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 240)];
        [myScrollView setImagePathsInBundle:self.imageNames];
        [_myView addSubview:myScrollView];
        [myScrollView setAutoRunEnableWithInterval:3];
        myScrollView.playDirection = Right;
        myScrollView.timeInterval = 3;
        myScrollView.pageControlEnable = YES;
        
        //添加新闻和快讯按钮按钮

        _piecewiseSC.frame = CGRectMake(20, 255, self.view.frame.size.width - 40, 30);
        
        //添加方法
        
        [_piecewiseSC addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
        
        _piecewiseSC.selectedSegmentIndex = 0;
        [_myView addSubview:_piecewiseSC];
    }
    return _myView;
}

#pragma mark - 点击切换 cell
- (void)segmentAction:(UISegmentedControl *)segmented {
    switch (segmented.selectedSegmentIndex) {
        case 0:
            //切换数据源
            //刷新
            if (_tableView.dataSource == nil) {
                _tableView.dataSource = self;
                [_tableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:@"newsCell"];
                [self.tableView reloadData];
            }
            break;
            
            
        default:
            
            [_tableView registerClass:[AlertsTableViewCell class] forCellReuseIdentifier:@"alertsCell"];
            [self.tableView reloadData];
            break;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
//        [self.tableView reloadData];
        
    });
}







- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

//返回 cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell"];
    return cell;
}

//返回高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

//取消点击效果
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

//返回高度
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
    
    return 300;
}


//返回 view
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    return self.myView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
