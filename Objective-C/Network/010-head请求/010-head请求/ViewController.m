//
//  ViewController.m
//  010-head请求
//
//  Created by Peyet-Zhao on 2021/11/8.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/ferdowsi.jpg"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"head";
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            NSLog(@"连接错误 %@",connectionError);
            return;
        }
        
        //
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode == 200 || httpResponse.statusCode == 304) {
            //解析数据
            NSLog(@"-- data : %@ --", data);
            NSLog(@"response : %lld ", httpResponse.expectedContentLength);

        }else{
            NSLog(@"服务器内部错误");
        }
    }];

}


@end
