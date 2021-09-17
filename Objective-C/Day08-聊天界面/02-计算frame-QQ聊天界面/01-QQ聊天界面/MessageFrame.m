//
//  MessageFrame.m
//  01-QQ聊天界面
//
//  Created by Peyet-Zhao on 2021/9/16.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "MessageFrame.h"
#import <UIKit/UIKit.h>
#import "NSString+NSStringExtension.h"

@implementation MessageFrame

- (void)setMessage:(Message *)message {
    _message = message;
    
    
    
    CGFloat margin = 5;
    // 时间frame
    CGFloat timeX=0, timeY=0, timeW=414, timeH=20;
    if (!message.hideTime) {
        _timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    }
    
    
    // 头像frame
    CGFloat iconW=30, iconH=30, iconY=CGRectGetMaxY(_timeFrame)+margin;
    CGFloat iconX = message.type == MessageTypeMe ? 414 - margin - iconW : margin;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    
    // 正文frame
    // text的frame
    CGSize textSize = [message.text sizeOfTextWithMaxSize:CGSizeMake(200, MAXFLOAT) font:textFont];
    CGFloat textW = textSize.width + 40;
    CGFloat textH = textSize.height + 30;
    // 2. 再计算x,y
    CGFloat textY = iconY;
    CGFloat textX = message.type == MessageTypeOther ? CGRectGetMaxX(_iconFrame) : (414 - margin - iconW - textW);
    _textFrame = CGRectMake(textX, textY, textW, textH);

    
    
    CGFloat maxY = MAX(CGRectGetMaxY(_textFrame), CGRectGetMaxY(_iconFrame));
    _rowHeight = maxY + margin;
}

@end
