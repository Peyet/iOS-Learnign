//
//  Message.m
//  01-QQ聊天界面
//
//  Created by Peyet-Zhao on 2021/9/16.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "Message.h"

@implementation Message

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)messageWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
