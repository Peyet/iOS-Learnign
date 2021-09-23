//
//  Person.h
//  05KVC
//
//  Created by Peyet-Zhao on 2021/9/23.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;
@property (nonatomic, copy) NSString *email;

@property (nonatomic, strong) Dog *dog;


@end

NS_ASSUME_NONNULL_END
