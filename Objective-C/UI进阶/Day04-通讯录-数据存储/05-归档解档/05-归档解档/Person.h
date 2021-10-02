//
//  Person.h
//  05-归档解档
//
//  Created by Peyet-Zhao on 2021/10/2.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject <NSSecureCoding>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int age;
@property (class, readonly) BOOL supportsSecureCoding;

@end

NS_ASSUME_NONNULL_END
