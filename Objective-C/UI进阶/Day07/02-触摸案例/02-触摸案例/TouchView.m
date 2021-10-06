//
//  TouchView.m
//  02-触摸案例
//
//  Created by Peyet-Zhao on 2021/10/6.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch* touch = touches.anyObject;
    
    CGPoint p = [touch locationInView:self.superview];
    
    self.center = p;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch* touch = touches.anyObject;
    CGPoint p = [touch locationInView:self.superview];
    self.center = p;

    
    // 获取上一个点的坐标
    [touch previousLocationInView:self.superview];
}

@end
