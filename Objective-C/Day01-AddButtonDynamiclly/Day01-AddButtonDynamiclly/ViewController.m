//
//  ViewController.m
//  Day01-AddButtonDynamiclly
//
//  Created by Peyet-Zhao on 2021/8/28.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//  控制器中的view创建完成并加载完毕之后会执行此方法
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    创建空白button
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *button = [[UIButton alloc] init];
//    设置title
    [button setTitle:@"Click Me !!" forState:UIControlStateNormal];
    [button setTitle:@"ohhhh NOOOOO" forState:UIControlStateHighlighted];
//    设置字体颜色
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
//    设置背景图片
    UIImage *imgNormal = [UIImage imageNamed:@"btn_01"];
    UIImage *imgHeighLight = [UIImage imageNamed:@"btn_02"];
    [button setBackgroundImage:imgNormal forState:UIControlStateNormal];
    [button setBackgroundImage:imgHeighLight forState:UIControlStateHighlighted];
//    设置图片大小
    button.frame = CGRectMake(100, 200, 100, 100);
//    将创建的按钮加入到view中
    [self.view addSubview:button];
//    通过代码为按钮注册一个单击事件
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)buttonClick{
    NSLog(@"click~");
}


@end
