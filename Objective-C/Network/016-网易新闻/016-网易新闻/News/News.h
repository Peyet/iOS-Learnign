//
//  News.h
//  016-网易新闻
//
//  Created by Peyet-Zhao on 2021/11/23.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class News;
@interface News : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *digest;
@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, copy) NSNumber *replyCount;
@property (nonatomic, assign) BOOL hasImg;

+ (instancetype)newsWithDictionary:(NSDictionary *)dict;
+ (void)newsListWithSuccessBlock:(void(^)(NSArray *array))successBlock errorBlock:(void(^)(NSError *error))errorBlock;

- (NSString *)getReuseIdentifier;
- (CGFloat)getRowHeight;
@end

NS_ASSUME_NONNULL_END
