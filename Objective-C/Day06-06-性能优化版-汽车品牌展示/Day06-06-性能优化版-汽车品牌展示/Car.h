//
//  Car.h
//  Day06-06-性能优化版-汽车品牌展示
//
//  Created by Peyet-Zhao on 2021/9/12.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Car : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

- (instancetype) initWithDict:(NSDictionary *)dict;

+ (instancetype) carWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
