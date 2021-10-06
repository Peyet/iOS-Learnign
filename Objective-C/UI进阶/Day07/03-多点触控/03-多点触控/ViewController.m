//
//  ViewController.m
//  03-多点触控
//
//  Created by Peyet-Zhao on 2021/10/6.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    for (UITouch* touch in touches) {
//            UITouch* touch = touches.anyObject;
        CGPoint p =[touch locationInView:self.view];
        UIImageView* imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"spark_cyan"]];
        imgView.center = p;
        [self.view addSubview:imgView];

        [UIView animateWithDuration:3.0 animations:^{
            imgView.alpha = 0;

        } completion:^(BOOL finished) {
            [touch.view removeFromSuperview];
        }];

    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    for (UITouch* touch in touches) {
//            UITouch* touch = touches.anyObject;
        CGPoint p =[touch locationInView:self.view];
        UIImageView* imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"spark_cyan"]];
        imgView.center = p;
        [self.view addSubview:imgView];

        [UIView animateWithDuration:3.0 animations:^{
            imgView.alpha = 0;

        } completion:^(BOOL finished) {
            [touch.view removeFromSuperview];
        }];

    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
