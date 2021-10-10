//
//  ViewController.m
//  01-大转盘
//
//  Created by Peyet-Zhao on 2021/10/10.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "RotateView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 控制器背景(拉伸)
    self.view.layer.contents = (__bridge id)[UIImage imageNamed:@"LuckyBackground"].CGImage;
    
    RotateView* rotateView = [RotateView rotateView];
    [self.view addSubview:rotateView];
    
    rotateView.center = self.view.center;
    
    [rotateView startRotate];
}


@end
