//
//  TestViewController.m
//  01-Modal(代码)
//
//  Created by Peyet-Zhao on 2021/10/4.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.redColor;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"跳转消失");
    }];
}
@end
