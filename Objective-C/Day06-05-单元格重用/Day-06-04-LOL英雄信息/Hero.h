//
//  Hero.h
//  Day-06-04-LOL英雄信息
//
//  Created by Peyet-Zhao on 2021/9/10.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Hero : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *intro;


- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)hero:(NSDictionary *)dict;

@end
NS_ASSUME_NONNULL_END
