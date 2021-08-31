//
//  MyApp.m
//  Day03-ApplicationDownloader
//
//  Created by Peyet-Zhao on 2021/8/30.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "MyApp.h"

@implementation MyApp
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
    }
    return self;
}

+ (instancetype)appWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
