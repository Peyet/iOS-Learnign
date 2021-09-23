//
//  notificationReceiver.m
//  03-监听、发布通知-Example
//
//  Created by Peyet-Zhao on 2021/9/19.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "notificationReceiver.h"

@implementation notificationReceiver

- (void)notificationAlert:(NSNotification *)notification {
    NSLog(@"Notification is detected !!!");
    NSLog(@"%@", notification);
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
