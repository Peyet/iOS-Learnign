//
//  TouchView.m
//  01-触摸事件
//
//  Created by Peyet-Zhao on 2021/10/6.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"%s", __func__);
    UITouch* touch = touches.anyObject;
    NSLog(@"\n timestamp :%f\n phase:%ld\n tapCount:%ld\n ", touch.timestamp,
          touch.phase,
          touch.tapCount);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"%s", __func__);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"%s", __func__);
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"%s", __func__);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end
