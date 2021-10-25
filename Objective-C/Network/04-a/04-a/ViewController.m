//
//  ViewController.m
//  04-a
//
//  Created by Peyet-Zhao on 2021/10/25.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 第一种方式 无法设置请求头 无法控制缓存 无法设置超时时长
//    NSURL* url = [NSURL URLWithString:@"http://127.0.0.1/demo.json"];
//    NSData* data = [NSData dataWithContentsOfURL:url];
//    NSString* string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    NSLog(@"%@", string);
    
    
//    typedef NS_ENUM(NSUInteger, NSURLRequestCachePolicy)
//    {
//        NSURLRequestUseProtocolCachePolicy = 0,
//
//        NSURLRequestReloadIgnoringLocalCacheData = 1,
//        NSURLRequestReloadIgnoringLocalAndRemoteCacheData = 4,
//        NSURLRequestReloadIgnoringCacheData = NSURLRequestReloadIgnoringLocalCacheData,
//
//        NSURLRequestReturnCacheDataElseLoad = 2,
//        NSURLRequestReturnCacheDataDontLoad = 3,
//
//        NSURLRequestReloadRevalidatingCacheData = 5,
//    };
    // 第二种方式
    NSURL* url = [NSURL URLWithString:@"http://127.1.0.1/demo.json"];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:0 timeoutInterval:15];
    [request setValue:@"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.3 Safari/605.1.15" forHTTPHeaderField:@"User-Agent"];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]  completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        if (!connectionError) {
//            NSLog(@"--%@", response);
            NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode == 200 || httpResponse == 304) {
                NSString* string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"%@", string);
            } else {
                NSLog(@"服务器内部错误");
            }

        } else {
            NSLog(@"error: %@", connectionError);
        }

    }];
}


@end
