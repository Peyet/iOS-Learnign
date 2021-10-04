//
//  Panel.m
//  04-绘图的方式
//
//  Created by Peyet-Zhao on 2021/10/4.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "Panel.h"

@implementation Panel

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self method];
    [self method1];
    [self method2];
    [self method3];
    [self method4];
    [self method5];



}

- (void)method {
    
}

- (void)method1 {
    // 矩形
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(10, 10, 50, 50)];
    [path stroke];
}

- (void)method2 {
    // 圆角矩形
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(150, 50, 50, 50) cornerRadius:15];
    [path stroke];
}

- (void)method3 {
    // oc椭圆
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 222, 333)];
//    [path stroke];
    
    // c 椭圆
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //拼接路径
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 111, 155));
    // 渲染
    CGContextStrokePath(ctx);
}

- (void)method4 {
    // 画圆 : 1.通过画椭圆的方式(长和宽相等) 2. 通过画弧的方式
    // 1.
    //    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 30, 30)];
    //    [path stroke];

    // 2,
//    ArcCenter 圆心
//    radius 半径
//    startAngle 起始位置(点) 3点为起始点
//    endAngle 结束位置(点)
//    clockwise 是否顺时针
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:50 startAngle:0 endAngle:-0.5*M_PI clockwise:YES];
    [path stroke];
}

- (void)method5  {
    
}



@end
