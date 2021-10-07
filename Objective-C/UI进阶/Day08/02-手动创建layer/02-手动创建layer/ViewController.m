//
//  ViewController.m
//  02-手动创建layer
//
//  Created by Peyet-Zhao on 2021/10/7.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *layer;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CALayer* layer = [[CALayer alloc] init];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(200, 200);
    self.layer = layer;
    [self.view.layer addSublayer:layer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch* touch = touches.anyObject;
    CGPoint p = [touch locationInView:self.view];
    self.layer.position = p;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch* touch = touches.anyObject;
    CGPoint p = [touch locationInView:self.view];

    // 禁用隐式动画
    // 在事务中提交动画
    [CATransaction begin];
    
    [CATransaction setDisableActions:YES];
    self.layer.position = p;
    
    [CATransaction commit];
}

@end
