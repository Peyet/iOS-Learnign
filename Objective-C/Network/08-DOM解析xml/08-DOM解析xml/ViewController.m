//
//  ViewController.m
//  08-DOM解析xml
//
//  Created by Peyet-Zhao on 2021/11/1.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "GDataXMLNode.h"
#import "Video.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadXML];
}

- (void)loadXML {
    NSURL* url = [NSURL URLWithString:@"http://127.0.0.1/videos.xml"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (!connectionError) {
            NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode == 200 || httpResponse.statusCode == 304) {
                // DOM 对象模型
                GDataXMLDocument* document = [[GDataXMLDocument alloc] initWithData:data error:NULL];
                GDataXMLElement* rootElement = document.rootElement;
                
                NSMutableArray* mArray = [NSMutableArray arrayWithCapacity:10];
//                NSLog(@"--------%@", mArray);

                for (GDataXMLElement* element in rootElement.children) {
                    Video* v = [Video new];
                    [mArray addObject:v];
                    
                    for (GDataXMLElement* subElement in element.children) {
                        [v setValue:subElement.stringValue forKey:subElement.name];
                    }
                    
                    for (GDataXMLNode* attr in element.attributes) {
                        [v setValue:attr.stringValue forKey:attr.name];
                    }
                }
                
                NSLog(@"--------%@", mArray);
                
            } else {
                NSLog(@"服务器内部错误");
            }
        } else {
            NSLog(@"连接错误");
        }
    }];
}

@end
