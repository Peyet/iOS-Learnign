//
//  FileDownloader.m
//  011-下载文件
//
//  Created by Peyet-Zhao on 2021/11/8.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "FileDownloader.h"


//#import <NewsstandKit/NewsstandKit.h>
@interface FileDownloader () <NSURLConnectionDataDelegate>

@property (nonatomic, assign) long long expectedContentLength;
@property (nonatomic, assign) long long currentDownloadSize;

@property (nonatomic, strong) NSOutputStream *outputStream;


@end

@implementation FileDownloader

- (void)download:(NSString *)urlString {
    
    NSURL* url = [NSURL URLWithString:urlString];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}

// 接收到响应头
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    self.expectedContentLength = response.expectedContentLength;
    
    // 创建流
    self.outputStream = [NSOutputStream outputStreamToFileAtPath:@"/Users/peyet/Documents/testForder/222.exe" append:YES];
    // 打开流
    [self.outputStream open];
}


// 下载进度
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    self.currentDownloadSize += data.length;
    float process = 1.0 * self.currentDownloadSize / self.expectedContentLength;
    NSLog(@"download process is : %f", process);
    
    [self.outputStream write:data.bytes maxLength:data.length];
    
}


// 断点续传

//  下载完成
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"下载完成");
    [self.outputStream close];
}

// 处理错误
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"下载出错 : %@", error);
}

@end
