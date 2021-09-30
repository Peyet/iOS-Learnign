//
//  RedViewController.m
//  08-导航栏设置
//
//  Created by Peyet-Zhao on 2021/9/29.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "RedViewController.h"

@interface RedViewController ()

@end

@implementation RedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置导航控制器导航栏一般在view加载完成之后设置
//    self.navigationItem  获取当前控制器的导航栏
    
    // 设置标题
    self.navigationItem.title = @"红色控制器";
    
    // 设置标题控件
//    UIButton *btnAdd = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    [btnAdd addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.titleView = btnAdd;
    
    // 设置左侧按钮
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(btnClicked1)];
    self.navigationItem.leftBarButtonItem = left;
    
    // 设置右侧按钮 (多个)
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(btnClicked2)];
    UIBarButtonItem *right1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(btnClicked2)];
    self.navigationItem.rightBarButtonItems = @[right, right1];
    
    // 返回按钮
    UIBarButtonItem *btnBack = [[UIBarButtonItem alloc] initWithTitle:@"我要返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = btnBack;
}

- (void)btnClicked {
    NSLog(@"btn in the title clicked ");
}

- (void)btnClicked1 {
    NSLog(@"打开相机吗? ");
}

- (void)btnClicked2 {
    NSLog(@"这是书签🔖 ");
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
