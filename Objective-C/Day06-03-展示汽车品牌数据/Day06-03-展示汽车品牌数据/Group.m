//
//  Group.m
//  Day06-03-展示汽车品牌数据
//
//  Created by Peyet-Zhao on 2021/9/10.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "Group.h"

@implementation Group

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
//        self.title = dict[@"title"];
//        self.desc = dict[@"desc"];
//        self.cars = dict[@"cars"];
        [self setValuesForKeysWithDictionary:dict];
     }
    return self;
}

+ (instancetype)groupWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}



@end
