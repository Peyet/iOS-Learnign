//
//  MyNetWorkTools.m
//  016-网易新闻
//
//  Created by Peyet-Zhao on 2021/11/21.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "MyNetWorkTools.h"
#import <AFHTTPSessionManager.h>

@implementation MyNetWorkTools

+ (instancetype)sharedNetWorkTools {
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = 15.0;
        instance = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL sessionConfiguration:config];
    });
    return instance;
}

@end
