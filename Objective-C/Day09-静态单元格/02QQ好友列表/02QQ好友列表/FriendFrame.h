//
//  FriendFrame.h
//  02QQ好友列表
//
//  Created by Peyet-Zhao on 2021/9/20.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Friend.h"
#import <UIKit/UIKit.h>
#import "NSString+NSStringExtension.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendFrame : NSObject

@property (nonatomic, strong) Friend *friend;

@property (nonatomic, assign) CGRect icon;
@property (nonatomic, assign) CGRect intro;
@property (nonatomic, assign) CGRect name;
@property (nonatomic, assign) CGRect vip;
@property (nonatomic, assign) CGFloat rowHeight;

@end

NS_ASSUME_NONNULL_END
