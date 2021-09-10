//
//  Hero.m
//  Day-06-04-LOL英雄信息
//
//  Created by Peyet-Zhao on 2021/9/10.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "Hero.h"

@implementation Hero

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)hero:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
