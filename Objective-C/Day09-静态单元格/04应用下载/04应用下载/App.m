//
//  App.m
//  04应用下载
//
//  Created by Peyet-Zhao on 2021/9/23.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "App.h"

@implementation App

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)appWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
