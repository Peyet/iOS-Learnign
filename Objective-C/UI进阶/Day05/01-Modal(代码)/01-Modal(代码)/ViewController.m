//
//  ViewController.m
//  01-Modal(代码)
//
//  Created by Peyet-Zhao on 2021/10/4.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 跳转到 TestViewController
    TestViewController *vc = [TestViewController new];
    [self presentViewController:vc animated:YES completion:^{
        NSLog(@"跳转完成");
    }];
    
}


@end
