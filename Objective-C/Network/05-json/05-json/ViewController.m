//
//  ViewController.m
//  05-json
//
//  Created by Peyet-Zhao on 2021/10/29.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL* url = [NSURL URLWithString:@"http://127.0.0.1/demo.json"];
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
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            if (error) {
                NSLog(@"解析json错误, error:%@", error);
                return ;
            }
            NSLog(@"---%@", json);
        } else {
            NSLog(@"服务器内部错误");
        }
    }];
}


@end
