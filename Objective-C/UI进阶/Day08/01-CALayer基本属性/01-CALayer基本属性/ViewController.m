//
//  ViewController.m
//  01-CALayer基本属性
//
//  Created by Peyet-Zhao on 2021/10/7.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = UIColor.redColor;
    redView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:redView];
    
    // 边框
    redView.layer.borderWidth = 10;
    redView.layer.borderColor = UIColor.blueColor.CGColor;
    
    // 阴影
    redView.layer.shadowOffset = CGSizeMake(100, 100);
    redView.layer.shadowColor = UIColor.brownColor.CGColor;
    redView.layer.shadowOpacity = 1;
    redView.layer.shadowRadius = 50;
    
    // 圆角
    redView.layer.cornerRadius = 20;
//    redView.layer.masksToBounds = YES; // 剪切超出layer的部分
    
    // bounds
    redView.layer.bounds = CGRectMake(0, 0, 200, 200);
    
    // position
//    redView.layer.position = CGPointMake(0, 0); // 中心
    
    // 设置内容
    redView.layer.contents = (__bridge id)[UIImage imageNamed:@"me"].CGImage;
    
    
    
}


@end
