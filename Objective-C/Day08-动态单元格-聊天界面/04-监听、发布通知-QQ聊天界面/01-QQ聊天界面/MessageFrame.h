//
//  MessageFrame.h
//  01-QQ聊天界面
//
//  Created by Peyet-Zhao on 2021/9/16.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"
#import <CoreGraphics/CoreGraphics.h>
#define textFont [UIFont systemFontOfSize:18]

NS_ASSUME_NONNULL_BEGIN

@interface MessageFrame : NSObject

@property (nonatomic, strong) Message *message;
@property (nonatomic, assign, readonly) CGRect timeFrame;
@property (nonatomic, assign, readonly) CGRect iconFrame;
@property (nonatomic, assign, readonly) CGRect textFrame;
@property (nonatomic, assign, readonly) CGFloat rowHeight;

@end

NS_ASSUME_NONNULL_END
