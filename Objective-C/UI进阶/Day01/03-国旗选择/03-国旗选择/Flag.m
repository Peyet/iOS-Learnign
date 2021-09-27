//
//  Flag.m
//  03-国旗选择
//
//  Created by Peyet-Zhao on 2021/9/26.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "Flag.h"

@implementation Flag

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)flagWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
