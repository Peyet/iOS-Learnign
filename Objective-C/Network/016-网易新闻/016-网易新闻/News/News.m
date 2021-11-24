//
//  News.m
//  016-网易新闻
//
//  Created by Peyet-Zhao on 2021/11/23.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "News.h"
#import "MyNetWorkTools.h"

@implementation News

+ (instancetype)newsWithDictionary:(NSDictionary *)dict {
    News *news = [[self alloc] init];
    [news setValuesForKeysWithDictionary:dict];
    return news;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
//http://c.m.163.com/nc/article/headline/T1348647853363/0-140.html
+ (void)newsListWithSuccessBlock:(void(^)(NSArray *array))successBlock errorBlock:(void(^)(NSError *error))errorBlock {
    [[[MyNetWorkTools sharedNetWorkTools] GET:@"article/headline/T1348647853363/0-140.html" parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        if (successBlock) {
            
            NSString *rootKey = responseObject.keyEnumerator.nextObject;
            NSArray *array = responseObject[rootKey];
            NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:10];
            [array enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [mArray addObject:[self newsWithDictionary:obj]];
            }];
            successBlock(mArray.copy);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }] resume];
}

- (NSString *)getReuseIdentifier {
//WithNews:(News *)news {
    if (self.hasImg) {
        return @"newsCell1";
    }
    return @"newsCell";
}

- (CGFloat)getRowHeight {
    if (self.hasImg) {
        return 200;
    }
    return 80;
}

@end
