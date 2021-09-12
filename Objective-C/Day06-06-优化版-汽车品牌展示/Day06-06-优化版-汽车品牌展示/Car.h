//
//  Car.h
//  Day06-06-优化版-汽车品牌展示
//
//  Created by Peyet-Zhao on 2021/9/11.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Car : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray *cars;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)carWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
