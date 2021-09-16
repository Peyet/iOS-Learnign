//
//  Weibo.h
//  04-微博案例
//
//  Created by Peyet-Zhao on 2021/9/14.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Weibo : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign, getter=isVip) BOOL vip;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)weiboWithDict:(NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END
