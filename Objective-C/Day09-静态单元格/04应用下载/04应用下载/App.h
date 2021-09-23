//
//  App.h
//  04应用下载
//
//  Created by Peyet-Zhao on 2021/9/23.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface App : NSObject

@property (nonatomic, copy) NSString *size;
@property (nonatomic, copy) NSString *download;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)appWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
