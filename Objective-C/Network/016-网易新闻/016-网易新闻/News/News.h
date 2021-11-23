//
//  News.h
//  016-网易新闻
//
//  Created by Peyet-Zhao on 2021/11/23.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface News : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *digest;
@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, copy) NSNumber *replyCount;

+ (instancetype)newsWithDictionary:(NSDictionary *)dict;
+ (void)newsListWithSuccessBlock:(void(^)(NSArray *array))successBlock errorBlock:(void(^)(NSError *error))errorBlock;

@end

NS_ASSUME_NONNULL_END
