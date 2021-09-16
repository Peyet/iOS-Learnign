//
//  Message.h
//  01-QQ聊天界面
//
//  Created by Peyet-Zhao on 2021/9/16.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum{
    MessageTypeMe = 0,
    MessageTypeOther = 1
} MessageType;

@interface Message : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, assign) NSInteger type;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)messageWithDict:(NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END
