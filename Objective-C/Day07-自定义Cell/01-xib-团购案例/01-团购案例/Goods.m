//
//  Goods.m
//  01-团购案例
//
//  Created by Peyet-Zhao on 2021/9/13.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "Goods.h"

@implementation Goods

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self  = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)goodsWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
