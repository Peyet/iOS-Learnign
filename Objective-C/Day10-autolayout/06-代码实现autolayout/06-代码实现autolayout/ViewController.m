//
//  ViewController.m
//  06-代码实现autolayout
//
//  Created by Peyet-Zhao on 2021/9/24.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建蓝色View
    UIView * viewOfBlue = [UIView new];
    viewOfBlue.backgroundColor = [UIColor blueColor];
    [self.view addSubview:viewOfBlue];
//    viewOfBlue.frame = CGRectMake(0, 0, 100, 100);
    
    // 创建红色View
    UIView *viewOfRed = [UIView new];
    viewOfRed.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewOfRed];
//    viewOfRed.frame = CGRectMake(100, 100, 100, 100);
    
    
    // 禁用autoresiziong
    viewOfRed.translatesAutoresizingMaskIntoConstraints = NO;
    viewOfBlue.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 创建并添加约束
    // blue : 离super View 左上右均为30, 高度为50
    // 创建高度约束
    NSLayoutConstraint *blueHeightConstraint = [NSLayoutConstraint constraintWithItem:viewOfBlue attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50];
    // 将约束添加给控件
    [viewOfBlue addConstraint:blueHeightConstraint];
    // 其他约束
    NSLayoutConstraint *blueLeftConstraint = [NSLayoutConstraint constraintWithItem:viewOfBlue attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:30];
    [self.view addConstraint:blueLeftConstraint];
    
    NSLayoutConstraint *blueTopConstraint = [NSLayoutConstraint constraintWithItem:viewOfBlue attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:45];
    [self.view addConstraint:blueTopConstraint];
    
    NSLayoutConstraint *blueRightConstraint = [NSLayoutConstraint constraintWithItem:viewOfBlue attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-30];
    [self.view addConstraint:blueRightConstraint];

    // red : 离super View 左上右均为30, 高度为50
    // 创建高度约束 : 等于blue 的高度
    NSLayoutConstraint *redHeightConstraint = [NSLayoutConstraint constraintWithItem:viewOfRed attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:viewOfBlue attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    // 将约束添加给控件
    [self.view addConstraint:redHeightConstraint];
    // 其他约束
    NSLayoutConstraint *redLeftConstraint = [NSLayoutConstraint constraintWithItem:viewOfRed attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:viewOfBlue attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    [self.view addConstraint:redLeftConstraint];
    
    NSLayoutConstraint *redTopConstraint = [NSLayoutConstraint constraintWithItem:viewOfRed attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:viewOfBlue attribute:NSLayoutAttributeBottom multiplier:1 constant:30];
    [self.view addConstraint:redTopConstraint];
    
    NSLayoutConstraint *redRightConstraint = [NSLayoutConstraint constraintWithItem:viewOfRed attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:viewOfBlue attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    [self.view addConstraint:redRightConstraint];

    
}


@end
