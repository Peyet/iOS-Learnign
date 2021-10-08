//
//  ViewController.m
//  05-基本动画
//
//  Created by Peyet-Zhao on 2021/10/8.
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
    UIView* redView = [UIView new];
    redView.backgroundColor = UIColor.redColor;
    redView.frame = CGRectMake(100, 100, 20, 20);
    self.layer = redView.layer;
    [self.view addSubview:redView];
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self basicAnimation];
//    [self keyAnimation];
    [self animationGroup];
    
}

// 基本动画
- (void)basicAnimation {
    // 创建基本动画
    CABasicAnimation* animation = [[CABasicAnimation alloc] init];
    
    // 怎么做动画
    animation.keyPath = @"position.x";
    animation.fromValue = @(10);
    animation.toValue = @(300);
    //    animation.byValue = @(10); // 在自身的基础上累加
    // 不希望回到原来的位置
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    // 添加动画
    [self.layer addAnimation:animation forKey:nil];
}

// 关键帧动画
- (void)keyAnimation {
    CAKeyframeAnimation* keyAnimation = [CAKeyframeAnimation new];
    
    keyAnimation.keyPath = @"position";
    
    // 关键点
//    NSValue* v1 = [NSValue valueWithCGPoint:CGPointMake(10, 10)];
//    NSValue* v2 = [NSValue valueWithCGPoint:CGPointMake(300, 10)];
//    NSValue* v3 = [NSValue valueWithCGPoint:CGPointMake(10, 200)];
//    NSValue* v4 = [NSValue valueWithCGPoint:CGPointMake(300, 200)];
//    keyAnimation.values = @[v1, v2, v3, v4];
    
    // path
    UIBezierPath* path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 100)];
//    [path addLineToPoint:CGPointMake(300, 44)];
    [path addArcWithCenter:CGPointMake(200, 200) radius:100 startAngle:0 endAngle:2*M_PI clockwise:YES];
    keyAnimation.path = path.CGPath;
    keyAnimation.duration = 5;
    keyAnimation.repeatCount = INTMAX_MAX;
    
    [self.layer addAnimation:keyAnimation forKey:nil];
}

// 组动画
- (void)animationGroup {
    CAAnimationGroup* groupAnimation = [CAAnimationGroup new];
    
    CABasicAnimation* basicAnimation = [CABasicAnimation new];
    basicAnimation.keyPath = @"transform.rotation";
    basicAnimation.byValue = @(M_PI * 2 * 2 );
    
    CAKeyframeAnimation* keyAnimation = [CAKeyframeAnimation new];
    keyAnimation.keyPath = @"position";
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:100 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    keyAnimation.path = path.CGPath;
    
    groupAnimation.animations = @[basicAnimation, keyAnimation];
    groupAnimation.duration = 5;
    groupAnimation.repeatCount = INT_MAX;
    [self.layer addAnimation:groupAnimation forKey:nil];
}

@end
