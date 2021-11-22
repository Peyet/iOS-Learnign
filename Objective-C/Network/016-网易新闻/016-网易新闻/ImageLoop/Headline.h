//
//  Headline.h
//  016-网易新闻
//
//  Created by Peyet-Zhao on 2021/11/21.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Headline : NSObject

@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, copy) NSString *title;

+ (instancetype)headlineWithDictionary:(NSDictionary *)dict;
+ (void)headlineWithSuccessBlock:(void(^)(NSArray *array))success errorBlock:(void(^)(void))error;

@end

NS_ASSUME_NONNULL_END
