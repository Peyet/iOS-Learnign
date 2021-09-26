//
//  city.m
//  02-省市选择
//
//  Created by Peyet-Zhao on 2021/9/25.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "city.h"

@implementation city

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)cityWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
