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
}


// 下载进度
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    self.currentDownloadSize += data.length;
    float process = 1.0 * self.currentDownloadSize / self.expectedContentLength;
    NSLog(@"download process is : %f", process);
    
    [self saveFileToDisk:data];
    
    
}

// 保存数据到磁盘
- (void)saveFileToDisk:(NSData *)data {
    NSString* path = @"/Users/peyet/Documents/testForder/abc.exe";
    NSFileHandle* fileHandle = [NSFileHandle fileHandleForWritingAtPath:path];
    if (fileHandle == nil) {
        [data writeToFile:path atomically:YES];
    } else {
        // 让offset指向文件的末尾
        [fileHandle seekToEndOfFile];
        
        // 写入文件
        [fileHandle writeData:data];
        
        // 关闭文件
        [fileHandle closeFile];
    }
}

// 断点续传

//  下载完成
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"下载完成");
}

// 处理错误
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"下载出错 : %@", error);
}

@end
