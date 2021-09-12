//
//  Group.m
//  Day06-06-性能优化版-汽车品牌展示
//
//  Created by Peyet-Zhao on 2021/9/12.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "Group.h"
#import "Car.h"

@implementation Group

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        // 手动字典转模型
        NSMutableArray *modelArrayOfCars = [NSMutableArray new];
        for (NSDictionary *dict in self.cars) {
            Car *car = [Car carWithDict:dict];
            [modelArrayOfCars addObject:car];
        }
        self.cars = modelArrayOfCars;
    }
    return self;
}

+ (instancetype)groupWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
