//
//  Weibo.m
//  04-微博案例
//
//  Created by Peyet-Zhao on 2021/9/14.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "Weibo.h"

@implementation Weibo

- (instancetype)initWithDict:(NSDictionary *)dict {
    [self setValuesForKeysWithDictionary:dict];
    return self;
}

+ (instancetype)weiboWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}


@end
