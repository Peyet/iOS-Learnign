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
//    [self method1];
//    [self method2];
//    [self method3];
//    [self method4];
    [self method5];

    
}

- (void)method1 {
    // 1.纯c实现
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 画图
    CGContextMoveToPoint(ctx, 10, 40);
    CGContextAddLineToPoint(ctx, 278, 22);
    // 渲染
    CGContextStrokePath(ctx);

}

- (void)method2 {
    // 2.纯c实现
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 拼接路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 22, 22);
    CGPathAddLineToPoint(path, NULL, 222, 222);
    // 将路径添加到上下文中
    CGContextAddPath(ctx, path);
    // 渲染
    CGContextStrokePath(ctx);
}

- (void)method3 {
    // 3.c + oc 实现 (oc -> c)
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 拼接路径
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(200, 200)];
    // 将路径添加到上下文中 (将oc的path转为 c的path)
    CGContextAddPath(ctx, path.CGPath);
    // 渲染
    CGContextStrokePath(ctx);
}

- (void)method4 {
    // 3.c + oc 实现 ( c -> oc -> c)
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 拼接路径 (c)
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 22, 22);
    CGPathAddLineToPoint(path, NULL, 222, 222);
    // 拼接路径 (oc)
    UIBezierPath *path1 = [UIBezierPath bezierPathWithCGPath:path];
    [path1 addLineToPoint:CGPointMake(88, 10)];
    // 将路径添加到上下文中 (将oc的path转为 c的path)
    CGContextAddPath(ctx, path1.CGPath);
    // 渲染
    CGContextStrokePath(ctx);
}

- (void)method5 {
    // 5. 纯oc
    // 创建路径对象
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 拼接路径
    [path moveToPoint:CGPointMake(11, 22)];
    [path addLineToPoint:CGPointMake(77, 333)];
    //渲染
    [path stroke];
}



@end
