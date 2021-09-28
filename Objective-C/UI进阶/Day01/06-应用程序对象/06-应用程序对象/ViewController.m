//
//  ViewController.m
//  06-应用程序对象
//
//  Created by Peyet-Zhao on 2021/9/27.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()
- (IBAction)btnClicked:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)btnClicked:(UIButton *)sender {
    /**
            1. 应用程序对象 是 UIApplication, 是应用程序的对象 , 主要执行应用级别的操作
            2. 应用程序对象的获取  [ UIApplication sharedApplication]
     */
    
    UIApplication *app0 = [UIApplication sharedApplication];
    UIApplication *app1 = [UIApplication sharedApplication];
    
    NSLog(@"app0 = %@\napp1 = %@", app0, app1);
    
//    app0 registerUserNotificationSettings:<#(nonnull UIUserNotificationSettings *)#>
    UNUserNotificationCenter *userNotification = [UNUserNotificationCenter currentNotificationCenter];
    [userNotification requestAuthorizationWithOptions:UNAuthorizationOptionBadge completionHandler:^(BOOL granted, NSError * _Nullable error) {
        
    }];
    

    // 设置应用头像上的数字
    // set to 0 to hide. default is 0. In iOS 8.0 and later, your application must register for user notifications using -[UIApplication registerUserNotificationSettings:] before being able to set the icon badge.
    app0.applicationIconBadgeNumber = 10;
    
    // 设置联网状态
    app0.networkActivityIndicatorVisible = YES;
    
}
@end
