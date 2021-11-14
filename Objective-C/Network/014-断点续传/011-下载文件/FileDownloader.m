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

@property (nonatomic, copy) NSString *filePath;


@end

@implementation FileDownloader

- (void)download:(NSString *)urlString {
    
    NSURL* url = [NSURL URLWithString:urlString];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    
    [self getServerFileInfo:url];
    self.currentDownloadSize = [self checkLocalFileInfo];
    if (self.currentDownloadSize < 0) {
        NSLog(@"文件已经下载完成,无需重复下载");
        return ;
    }
    
    [request setValue:[NSString stringWithFormat:@"bytes:%lld-", self.currentDownloadSize] forHTTPHeaderField:@"Rang"];
    NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}

- (void)getServerFileInfo:(NSURL *)url {
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"head";
    NSURLResponse* response = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:NULL];
    self.filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:response.suggestedFilename];
    self.expectedContentLength = response.expectedContentLength;
}

- (long long)checkLocalFileInfo {
    long long fileSize = 0;
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:self.filePath]) {
        NSDictionary* attr = [fileManager attributesOfItemAtPath:self.filePath error:NULL];
        fileSize = attr.fileSize;
        if (fileSize == self.expectedContentLength) {
            fileSize = -1;
        }
        if (fileSize > self.expectedContentLength) {
            NSLog(@"文件出错,开始重新下载");
            [fileManager removeItemAtPath:self.filePath error:NULL];
            fileSize = 0;
        }
    }
    
    return fileSize;
}


// 接收到响应头
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    // 创建流
    self.outputStream = [NSOutputStream outputStreamToFileAtPath:[self filePath] append:YES];
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
