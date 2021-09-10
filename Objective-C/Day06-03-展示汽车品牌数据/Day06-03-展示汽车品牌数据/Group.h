//
//  Group.h
//  Day06-03-展示汽车品牌数据
//
//  Created by Peyet-Zhao on 2021/9/10.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Group : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;

@property (nonatomic, strong) NSArray *cars;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)groupWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
