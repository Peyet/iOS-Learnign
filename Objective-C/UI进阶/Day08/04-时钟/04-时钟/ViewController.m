//
//  ViewController.m
//  04-时钟
//
//  Created by Peyet-Zhao on 2021/10/7.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer* second;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CALayer* clock = [CALayer new];
    clock.bounds = CGRectMake(0, 0, 300, 300);
    clock.position = CGPointMake(207, 207);
    
    clock.contents = (__bridge id)[UIImage imageNamed:@"clock"].CGImage;
    clock.cornerRadius = 150;
    clock.masksToBounds = YES;
    
    CALayer* second = [CALayer new];
    second.bounds = CGRectMake(0, 0, 5, 150);
    second.position = clock.position;
    second.backgroundColor = UIColor.systemPinkColor.CGColor;
    second.anchorPoint = CGPointMake(0.5, 0.8);
    self.second = second;
    
    CALayer* point = [CALayer new];
    point.bounds = CGRectMake(0, 0, 10, 10);
    point.position = clock.position;
    point.backgroundColor = UIColor.blackColor.CGColor;
    
    [self.view.layer addSublayer:clock];
    [self.view.layer addSublayer:second];
    [self.view.layer addSublayer:point];
    
    // 1. 计时器
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    
    // 2. CADisplayLink
    CADisplayLink* link = [CADisplayLink displayLinkWithTarget:self selector:@selector(time)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    [self timeChange];
}

- (void)timeChange {
    CGFloat angle = M_PI_2 / 15;
    
    NSDate* date = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    CGFloat time = [calendar component:NSCalendarUnitSecond fromDate:date];
    
    self.second.affineTransform = CGAffineTransformMakeRotation(angle * time);
}

- (void)time {
    NSLog(@"time");
}
@end
