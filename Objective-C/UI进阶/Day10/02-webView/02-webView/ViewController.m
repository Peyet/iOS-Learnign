//
//  ViewController.m
//  02-webView
//
//  Created by Peyet-Zhao on 2021/10/14.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WKWebViewConfiguration* config = [[WKWebViewConfiguration alloc] init];
    WKWebView* webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, 414, 400) configuration:config];
    
    NSURL* url = [NSURL URLWithString:@"http://www.bing.com"];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:url];
    
    [webView loadRequest:request];
    webView.userInteractionEnabled = YES;
    
    [self.view addSubview:webView];
    
    
    
    UIButton* button = [UIButton new];
    [button setTitle:@"发短信" forState:UIControlStateNormal];
    [button setBackgroundColor:UIColor.redColor];
    button.frame = CGRectMake(200, 500, 100, 100);
    [button addTarget:self action:@selector(makeCall) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton* threadButton = [UIButton new];
    threadButton.frame = CGRectMake(100, 600, 100, 100);
    [threadButton setBackgroundColor:UIColor.greenColor];
    [threadButton setTitle:@"线程" forState:UIControlStateNormal];
    [threadButton addTarget:self action:@selector(thread) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:threadButton];
}

- (void)makeCall {
    NSLog(@"121212121");
    UIApplication* app = [UIApplication sharedApplication];
    NSURL* url = [NSURL URLWithString:@"sms://10010"];
    NSDictionary* dict;
//    = @{UIApplicationOpenURLOptionUniversalLinksOnly : @YES };
    [app openURL:url options:dict completionHandler:^(BOOL success) {
        
    }];
}

- (void)thread {
    [NSThread sleepForTimeInterval:5];
    NSLog(@"thread");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSThread* thread = [[NSThread alloc] initWithTarget:self selector:@selector(thread) object:nil];
    [thread start];
    NSLog(@"....");
//    [thread start]; 
}

@end
