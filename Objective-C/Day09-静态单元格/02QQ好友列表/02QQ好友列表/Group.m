//
//  Group.m
//  02QQ好友列表
//
//  Created by Peyet-Zhao on 2021/9/20.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "Group.h"

@implementation Group

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *friendsOfModel = [NSMutableArray new];
        for (NSDictionary *dict in self.friends) {
            Friend *friend = [Friend friendWithDict:dict];
            FriendFrame *friendFrame = [FriendFrame new];
            friendFrame.friend = friend;
            [friendsOfModel addObject:friendFrame];
        }
        self.friends = friendsOfModel;
    }
    return self;
}

+ (instancetype)groupWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
