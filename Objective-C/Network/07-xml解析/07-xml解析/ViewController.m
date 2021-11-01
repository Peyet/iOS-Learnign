//
//  ViewController.m
//  07-xml解析
//
//  Created by Peyet-Zhao on 2021/11/1.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "Video.h"

@interface ViewController () <NSXMLParserDelegate>

@property (nonatomic, strong) NSMutableArray *Videos;
@property (nonatomic, strong) Video *currentVideo;
@property (nonatomic, copy) NSMutableString *str;



@end

@implementation ViewController

- (NSMutableArray *)Videos {
    if (!_Videos) {
        _Videos = [NSMutableArray arrayWithCapacity:10];
    }
    return _Videos;
}

- (NSString *)str {
    if (!_str) {
        _str = [NSMutableString string];
    }
    return _str;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL* url = [NSURL URLWithString:@"http://127.0.0.1/videos.xml"];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]  completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse *) response;
        if (!connectionError) {
            if (httpResponse.statusCode == 200 || httpResponse.statusCode == 304) {
                NSXMLParser* parser = [[NSXMLParser alloc] initWithData:data];
                // 设置代理
                parser.delegate = self;
                // 开始执行代理的方法,在代理的方法中开始解析
                [parser parse];
            } else {
                NSLog(@"服务器内部错误");
            }
        } else {
            NSLog(@"连接错误");
        }
    }];
}

#pragma mark - XmlParserDelegate
// 代理方法执行的线程 在 设置代理属性所在的线程
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"1.开始解析文档");
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
//    elementName 标签名字
//    attributeDict 标签属性
    NSLog(@"2.找开始节点 %@,  %@", elementName, attributeDict);
    if ([elementName isEqualToString:@"video"]) {
        self.currentVideo = [Video new];
        self.currentVideo.videoId = @([attributeDict[@"videoId"] intValue]);
        [self.Videos addObject:self.currentVideo];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSLog(@"3.找节点的内容 : %@", string);
    [self.str appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"4.结束节点 : %@", elementName);
    
//    if ([elementName isEqualToString:@"name"]) {
//        self.currentVideo.name = self.str;
//    } else if ([elementName isEqualToString:@"length"]) {
//        self.currentVideo.length = @([self.str intValue]);
//    } else if ([elementName isEqualToString:@"videoURL"]) {
//        self.currentVideo.videoURL = self.str;
//    } else if ([elementName isEqualToString:@"imageURL"]) {
//        self.currentVideo.imageURL = self.str;
//    }  else if ([elementName isEqualToString:@"desc"]) {
//        self.currentVideo.desc = self.str;
//     } else if ([elementName isEqualToString:@"teacher"]) {
//        self.currentVideo.teacher = self.str;
//    }
    
    //KVC
    if (![elementName isEqualToString:@"videos"] && ![elementName isEqualToString:@"video"]) {
            [self.currentVideo setValue:self.str forKey:elementName];
    }
    
    [self.str setString:@""];
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"5.结束解析文档");
    NSLog(@"----------%@", self.Videos);
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"解析出错");
}


@end
