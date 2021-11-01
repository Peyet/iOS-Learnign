//
//  ViewController.m
//  06-plist解析
//
//  Created by Peyet-Zhao on 2021/10/30.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
        NSURL* url = [NSURL URLWithString:@"http://127.0.0.1/videos.plist"];
    //    NSURLRequest* request = [NSURLRequest requestWithURL:url];
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:15];
        
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
            if (connectionError) {
                NSLog(@"---error--- : %@", connectionError);
                return ;
            }
            NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode == 200 || httpResponse.statusCode == 304) {
                NSError* error;
                id plist = [NSPropertyListSerialization propertyListWithData:data options:0 format:0 error: NULL];
                if (error) {
                    NSLog(@"解析json错误, error:%@", error);
                    return ;
                }
                NSLog(@"---%@", plist);
            } else {
                NSLog(@"服务器内部错误");
            }
        }];

}


@end
