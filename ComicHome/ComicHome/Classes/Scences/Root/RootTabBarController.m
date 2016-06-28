//
//  RootTabBarController.m
//  ComicHome
//
//  Created by lanou3g on 16/6/24.
//  Copyright © 2016年 王海. All rights reserved.
//

#import "RootTabBarController.h"
// 漫画
#import "ComicViewController.h"
// 新闻
#import "NewsViewController.h"
// 小说
#import "NorvelViewController.h"
// 我
#import "MineViewController.h"

#import "NewssViewController.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 风格设置
    [self appearanceSettings];
    // 添加视图控制
    [self addManyChildViewControllers];
}

#pragma mark - appearance
- (void)appearanceSettings {
    // 设置tabbar的风格
    [[UITabBar appearance] setBarStyle:UIBarStyleDefault];
    // 设置navigationbar的风格
    [[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
}

#pragma mark - 添加一组子视图控制器
- (void)addManyChildViewControllers {
    // 漫画
    [self addOneChildViewController:[[ComicViewController alloc] init] title:@"漫画" normalImage:nil selectedImage:nil];
    // 新闻
    [self addOneChildViewController:[[NewssViewController alloc] init] title:@"新闻" normalImage:nil selectedImage:nil];
    // 小说
    [self addOneChildViewController:[[NorvelViewController alloc] init] title:@"小说" normalImage:nil selectedImage:nil];
    // 我的
    [self addOneChildViewController:[[MineViewController alloc] init] title:@"我的" normalImage:nil selectedImage:nil];
}

#pragma mark - 添加一个子视图控制器
- (void)addOneChildViewController:(UIViewController *)viewController
                            title:(NSString *)title
                      normalImage:(NSString *)normalImage
                    selectedImage:(NSString *)selectedImage {
    viewController.view.backgroundColor = [UIColor lightGrayColor];
    viewController.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:normalImage];
    UIImage *image = [UIImage imageNamed:selectedImage];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = image;
    // 添加子视图
    [self addChildViewController:[[UINavigationController alloc] initWithRootViewController:viewController]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
