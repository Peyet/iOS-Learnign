//
//  ViewController.m
//  05-手势识别
//
//  Created by Peyet-Zhao on 2021/10/7.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iamgeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 1.创建手势对象
    // 2.为view添加手势
    // 3.实现手势方法
    
    // 1.创建手势对象
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
//    tap.
    // 2.为view添加手势
    [self.iamgeView addGestureRecognizer:tap];
    
    
//    @property (nonatomic) NSUInteger  numberOfTapsRequired;       // Default is 1. The number of taps required to match
//    @property (nonatomic) NSUInteger  numberOfTouchesRequired API_UNAVAILABLE(tvos);    // Default is 1. The number of fingers required to match 几根手指同时点击
    tap.numberOfTapsRequired = 2;
    tap.numberOfTouchesRequired = 2;
    // 两根手指,每根点击两下
    
    // 3.实现手势方法
}

// 3.实现手势方法
- (void)tap:(UITapGestureRecognizer *)sender {
    NSLog(@"tap");
}

@end
