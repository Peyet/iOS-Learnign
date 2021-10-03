//
//  Contact.h
//  01-通讯录
//
//  Created by Peyet-Zhao on 2021/10/1.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject <NSSecureCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phoneNumber;
@property (class, readonly) BOOL supportsSecureCoding;

@end

NS_ASSUME_NONNULL_END
