//
//  MessageFrame.h
//  05QQ聊天
//
//  Created by Peyet-Zhao on 2021/9/19.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Message.h"

NS_ASSUME_NONNULL_BEGIN

@interface MessageFrame : NSObject

@property (nonatomic, strong) Message *message;

@property (nonatomic, assign) CGRect lblTime;
@property (nonatomic, assign) CGRect imgIcon;
@property (nonatomic, assign) CGRect btnText;
@property (nonatomic, assign) CGFloat rowHeight;

@end

NS_ASSUME_NONNULL_END
