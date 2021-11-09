//
//  FileDownloader.m
//  011-下载文件
//
//  Created by Peyet-Zhao on 2021/11/8.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "FileDownloader.h"


//#import <NewsstandKit/NewsstandKit.h>
//  只有使用 <NewsstandKit/NewsstandKit.h> 框架(报刊杂志类应用)时,<NSURLConnectionDownloadDelegate>才会起作用,否则下载完成后看不到文件
@interface FileDownloader () <NSURLConnectionDownloadDelegate>

@end

@implementation FileDownloader

- (void)download:(NSString *)urlString {
    
    NSURL* url = [NSURL URLWithString:urlString];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
//        [data writeToFile:@"/Users/peyet/Pictures/ZhiHu/abc.jpg" atomically:YES];
//        NSLog(@"response : %@", response);
//        NSLog(@"下载完成");
//    }];
    
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
}

// 下载进度
- (void)connection:(NSURLConnection *)connection didWriteData:(long long)bytesWritten totalBytesWritten:(long long)totalBytesWritten expectedTotalBytes:(long long) expectedTotalBytes {
    float process = 1.0 * totalBytesWritten / expectedTotalBytes;
    NSLog(@"download process : %f", process);
}

// 断点续传
- (void)connectionDidResumeDownloading:(NSURLConnection *)connection totalBytesWritten:(long long)totalBytesWritten expectedTotalBytes:(long long) expectedTotalBytes {
    
}

//  下载完成
- (void)connectionDidFinishDownloading:(NSURLConnection *)connection destinationURL:(NSURL *) destinationURL {
    NSLog(@"download completed in thread %@!\n file dircectory is : %@", [NSOperationQueue currentQueue], destinationURL);
}

// 处理错误
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
}

@end
