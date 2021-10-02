//
//  Person.m
//  05-归档解档
//
//  Created by Peyet-Zhao on 2021/10/2.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeInt:self.age forKey:@"age"];
    [coder encodeObject:self.name forKey:@"name"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    if (self = [super init]) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.age = [coder decodeIntForKey:@"age"];
    }
    return self;
}


// 这个是类方法, property 中 定义的 是 class
//@property (class, readonly) BOOL supportsSecureCoding;

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
