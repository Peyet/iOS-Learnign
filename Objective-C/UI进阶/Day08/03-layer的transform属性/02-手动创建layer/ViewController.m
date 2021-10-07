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
    
    layer.contents = (__bridge id)[UIImage imageNamed:@"me"].CGImage;
    
    [self.view.layer addSublayer:layer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 旋转
//    self.layer.transform = CATransform3DRotate(self.layer.transform, M_PI_4, 0, 0, 1);
    
    // 缩放
//    self.layer.transform = CATransform3DScale(self.layer.transform, 0.5, 1, 1);
    
    
    // 平移
    self.layer.transform = CATransform3DTranslate(self.layer.transform, 10, 0, 0);
}


@end
