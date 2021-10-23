//
//  ViewController.m
//  01-发送异步网络请求
//
//  Created by Peyet-Zhao on 2021/10/23.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *wkWebView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.baidu.com"]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (!connectionError) {
            NSString* html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"html : %@", html);
            
            [self.wkWebView loadHTMLString:html baseURL:nil];
        } else {
            NSLog(@"error : %@", connectionError);
        }
    }];
}

@end
