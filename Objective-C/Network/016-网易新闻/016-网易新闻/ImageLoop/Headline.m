//
//  Headline.m
//  016-网易新闻
//
//  Created by Peyet-Zhao on 2021/11/21.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "Headline.h"
#import "MyNetWorkTools.h"

@implementation Headline
+ (instancetype)headlineWithDictionary:(NSDictionary *)dict {
    Headline *headline = [Headline new];
    [headline setValuesForKeysWithDictionary:dict];
    return headline;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

+ (void)headlineWithSuccessBlock:(void(^)(NSArray *array))success errorBlock:(void(^)(void))error {
    MyNetWorkTools *netWorkTools = [MyNetWorkTools sharedNetWorkTools];
    [[netWorkTools GET:@"ad/headline/0-4.html" parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
//        NSLog(@"-response : %@", responseObject);
        NSString *rootKey = responseObject.keyEnumerator.nextObject;
        NSArray *array = responseObject[rootKey];
        NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:4];
        [array enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [mArray addObject:[Headline headlineWithDictionary:obj]];
        }];
        if (success) {
            success(mArray);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error2) {
//        NSLog(@"-error : %@", error);
        if (error) {
            error();
        }
    }] resume];

}
@end
