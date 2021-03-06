//
//  Car.m
//  Day06-06-性能优化版-汽车品牌展示
//
//  Created by Peyet-Zhao on 2021/9/12.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "Car.h"

@implementation Car

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)carWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
