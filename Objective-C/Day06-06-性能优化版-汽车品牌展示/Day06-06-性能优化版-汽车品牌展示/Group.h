//
//  Group.h
//  Day06-06-性能优化版-汽车品牌展示
//
//  Created by Peyet-Zhao on 2021/9/12.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Group : NSObject

@property (nonatomic, strong) NSArray *cars;
@property (nonatomic, copy) NSString *title;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)groupWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
