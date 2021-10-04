//
//  Panel.m
//  03-绘图步骤
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
    
    // 获取当前绘图上下文
    CGContextRef ctx =UIGraphicsGetCurrentContext();
    
    // 拼接路径 同时把路径添加到上下文
    CGContextMoveToPoint(ctx, 20, 20);      // 起点
    CGContextAddLineToPoint(ctx, 100, 100); // 终点
    CGContextAddLineToPoint(ctx, 10, 100);
    
    CGContextMoveToPoint(ctx, 50, 200);
    CGContextAddLineToPoint(ctx, 200, 200);
    
    // 渲染
    CGContextStrokePath(ctx);
}


@end
