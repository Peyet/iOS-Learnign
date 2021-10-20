//
//  AppInfo.m
//  05-异步下载网络图片
//
//  Created by Peyet-Zhao on 2021/10/20.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo

- (instancetype)initWithDict:(NSDictionary *)dict {
    if ([super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)appInfoWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)appInfos {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"apps.plist" ofType:nil];
    NSArray* dictOfApp = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray* models = [NSMutableArray arrayWithCapacity:10];
//    for (NSDictionary* dict in dictOfApp) {
//        AppInfo* model = [AppInfo appInfoWithDict:dict];
//        [models addObject:model];
//    }
    [dictOfApp enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        AppInfo* model = [self appInfoWithDict:obj];
        [models addObject:model];
    }];
    return models.copy;
    
}

@end
