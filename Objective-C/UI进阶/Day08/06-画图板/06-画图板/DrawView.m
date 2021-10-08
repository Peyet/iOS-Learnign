//
//  DrawView.m
//  06-画图板
//
//  Created by Peyet-Zhao on 2021/10/8.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "DrawView.h"
#import "MyBezierPath.h"

@interface DrawView ()

//@property (nonatomic, strong) MyBezierPath *path;

@property (nonatomic, strong) NSMutableArray *paths;

@end

@implementation DrawView

//- (MyBezierPath *)path {
//    if (!_path) {
//        _path = [MyBezierPath new];
//    }
//    return _path;
//}

- (NSMutableArray *)paths {
    if (!_paths) {
        _paths = [NSMutableArray new];
    }
    return _paths;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch* touch = touches.anyObject;
    CGPoint p = [touch locationInView:touch.view];
    
    MyBezierPath* path = [MyBezierPath new];
    path.lineWidth = self.lineWidth;
    path.lineColor = self.color;
    [self.paths addObject:path];
    [[self.paths lastObject] moveToPoint:p];

    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch* touch = touches.anyObject;
    CGPoint p = [touch locationInView:touch.view];
    
    [[self.paths lastObject] addLineToPoint:p];
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    MyBezierPath* path = [self.paths lastObject];
    path.lineJoinStyle = kCGLineJoinRound;
    for (MyBezierPath* path in self.paths) {
        [path.lineColor set];
        [path stroke];
    }
    
}

@end
