//
//  main.m
//  03-监听、发布通知-Example
//
//  Created by Peyet-Zhao on 2021/9/19.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "notificationSender.h"
#import "notificationReceiver.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        
        notificationReceiver *receiver = [notificationReceiver new];
        notificationSender *sender = [notificationSender new];
        
        
        [notificationCenter addObserver:receiver selector:@selector(notificationAlert:) name:@"firstNotification" object:sender];
//        notificationCenter addobserver
        
        
        [notificationCenter postNotificationName:@"firstNotification" object:sender userInfo:@{
            @"title" : @"BigNewsInTheDay",
            @"content" : @"OurSalaryWillIncrease."
        }];
        
        
        
    }
    return 0;
}
