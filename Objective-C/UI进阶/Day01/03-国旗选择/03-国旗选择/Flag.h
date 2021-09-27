//
//  Flag.h
//  03-国旗选择
//
//  Created by Peyet-Zhao on 2021/9/26.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Flag : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)flagWithDict:(NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END
