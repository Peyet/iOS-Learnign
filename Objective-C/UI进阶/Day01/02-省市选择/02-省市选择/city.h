//
//  city.h
//  02-省市选择
//
//  Created by Peyet-Zhao on 2021/9/25.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface city : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray *cities;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)cityWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
