//
//  Question.m
//  Day04-GuessName
//
//  Created by Peyet-Zhao on 2021/9/1.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "Question.h"

@implementation Question

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
        self.answer = dict[@"answer"];
        self.options = dict[@"options"];
    }
    return self;
}

+ (instancetype)questionWithDict:(NSDictionary *)dict {
    return[[Question alloc] initWithDict:dict];
}

@end
