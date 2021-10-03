//
//  Contact.m
//  01-通讯录
//
//  Created by Peyet-Zhao on 2021/10/1.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "Contact.h"

@implementation Contact

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.phoneNumber forKey:@"phoneNumber"];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        [coder decodeObjectOfClass:Contact.class forKey:@"Contact"];
        self.name = [coder decodeObjectForKey:@"name"];
        self.phoneNumber = [coder decodeObjectForKey:@"phoneNumber"];
    }
    return self;
}

@end
