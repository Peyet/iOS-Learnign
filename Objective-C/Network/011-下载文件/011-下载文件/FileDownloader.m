//
//  FileDownloader.m
//  011-下载文件
//
//  Created by Peyet-Zhao on 2021/11/8.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "FileDownloader.h"

@implementation FileDownloader

- (void)download:(NSString *)urlString {
    
    NSURL* url = [NSURL URLWithString:urlString];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        [data writeToFile:@"/Users/peyet/Pictures/ZhiHu/abc.jpg" atomically:YES];
        NSLog(@"response : %@", response);
        NSLog(@"下载完成");
    }];
    
}


@end
