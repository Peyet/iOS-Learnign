//
//  MessageFrame.m
//  05QQ聊天
//
//  Created by Peyet-Zhao on 2021/9/19.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "MessageFrame.h"
#import "NSString+NSStringExtension.h"

#define textFont [UIFont systemFontOfSize:18]

@implementation MessageFrame

- (void)setMessage:(Message *)message {
    _message = message;
    // 计算frame
    CGFloat margin =5;
    // tiem
    CGFloat timeX = 0, timeY = 0, timeW = 414, timeH = 30;
    timeH = message.hideTime == YES ? 0 : timeH;
    self.lblTime = CGRectMake(timeX, timeY, timeW, timeH);
    
    
    // icon
    CGRect iconRect;
    CGFloat iconX = 369, iconY = timeH, iconW = 40, iconH = 40;
    if (message.type == MessageTypeMe) {
        iconX = 369;
        iconY = timeH;
        iconW = 40;
        iconH = 40;
    } else {
        iconX = margin;
        iconY = timeH;
        iconW = 40;
        iconH = 40;
    }
    self.imgIcon = CGRectMake(iconX, iconY, iconW, iconH);
    
    // text
    CGSize textSize = [message.text sizeOfTextWithMaxSize:CGSizeMake(300, MAXFLOAT) andFont:textFont];
    CGFloat textX,
            textY,
            textW = textSize.width + 40,
            textH = textSize.height +30;
    if (message.type == MessageTypeMe) {
        textX = 414 - iconW - margin - textW;
    } else {
        textX = CGRectGetMaxX(self.imgIcon);
    }
    textY = iconY;
    self.btnText = CGRectMake(textX, textY, textW, textH);
    
    self.rowHeight = CGRectGetMaxY(self.imgIcon) > CGRectGetMaxY(self.btnText) ? CGRectGetMaxY(self.imgIcon) : CGRectGetMaxY(self.btnText);
}


@end
