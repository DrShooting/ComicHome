//
//  NewsViewController.m
//  ComicHome
//
//  Created by 高杰 on 16/6/27.
//  Copyright © 2016年 王海. All rights reserved.
//

#import "NewsViewController.h"
#import "MyScrollView.h"
#import "NewsView.h"
#import "NetWorkRequestManager.h"
#import "NewsModel.h"
#import "CH_URL.h"
#import "NewsTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImage+ScaleToImageView.h"

@interface NewsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)NSMutableArray *imageNames;

//存放所有数据的大数组
@property (nonatomic, strong)NSMutableArray *allDataArray;

//存放轮播图数据的数据
@property (nonatomic, strong)NSMutableArray *allNewsArray;

@property (nonatomic, strong)NewsView *newsView;

@property (nonatomic, strong)NewsTableViewCell *newsTableViewCell;

@property (nonatomic, strong)NewsModel *model;



@end

@implementation NewsViewController

- (void)loadView {
    self.newsView = [[NewsView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.newsView;
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    //添加轮播图
    //    [self addShuffling];
    //注册 cell
    [self addTable];
    //解析数据
    [self requestData];
    
    _model = [[NewsModel alloc] init];
    
    
//    self.navigationController.navigationItem.title = @"动漫资讯";
//    self.title = @"动漫资讯";
    

    
}



//添加轮播图
- (void)addShuffling {
    self.imageNames = [NSMutableArray arrayWithObjects:
                       @"1.png",
                       @"h2.jpeg",
                       @"h3.jpeg",
                       @"h4.jpeg",
                       @"h5.jpeg",
                       @"h6.jpeg",
                       @"h7.jpeg",
                       @"h8.jpeg", nil];
    
    MyScrollView *myScrollView = [[MyScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    [myScrollView setImagePathsInBundle:self.imageNames];
    [self.newsView.tableView addSubview:myScrollView];
    [myScrollView setAutoRunEnableWithInterval:3];
    myScrollView.playDirection = Right;
    myScrollView.timeInterval = 3;
    myScrollView.pageControlEnable = YES;
}

//注册
- (void)addTable {
    
    // 设置数据源代理(用于处理数据)
    self.newsView.tableView.dataSource = self;
    
    // 用于显示视图相关内容
    self.newsView.tableView.delegate = self;
    
    // 注册cell
    [self.newsView.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"newsCell"];
    
}

//解析数据
- (void)requestData {
    __weak typeof(self)weakSelf = self;
    [NetWorkRequestManager requestType:GET urlString:CH_URL_SHUFFLING prama:nil success:^(id data) {
        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *allDataArray = dic[@"data"];
        for (NSDictionary *dict in allDataArray) {
//            NewsModel *newsModel = [[NewsModel alloc] init];
            [_model setValuesForKeysWithDictionary:dict];
            [weakSelf.allNewsArray addObject:_model];
            
            // 可以将数据通过时间进行排序
            
            [_allNewsArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                NewsModel *newsModel1 = (NewsModel *)obj1;
                NewsModel *newsModel2 = (NewsModel *)obj2;
                //                    return [newsModel2.pubdate newsModel1.pubdate];
                return [newsModel2.Id compare:newsModel1.Id];
            }];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //            // 刷新页面
            [weakSelf.newsView.tableView reloadData];
            //            // 隐藏
            //            [weakSelf hideGifView];
            
        });
    } fail:^(NSError *error) {
        NSLog(@"请求数据失败");
    }];
    
}



// 设置分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 100;
}
// 设置每个分区的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    // 1.从重用池查找cell
    
    if (indexPath.section == 0) {
        [self addShuffling];
    }
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsTableViewCell"];
    // 2.判断，如果没有找到创建cell对象
    if (!cell) {
        cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newsTableViewCell"];
        

        cell.timeLabel.text = _model.title;
//        NSURL *url = [[UIImageView alloc] initWithImage:[NSURL URLWithString:model.pic_url]];
        
//        UIImageView *imageview = [[UIImageView alloc] init];
        

//        [cell.imageView sd_setImageWithURL:model.pic_url];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:_model.pic_url]];
        
        return cell;
    }
    return cell;
}

//设置高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 265;
    }
    
    return 130;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
