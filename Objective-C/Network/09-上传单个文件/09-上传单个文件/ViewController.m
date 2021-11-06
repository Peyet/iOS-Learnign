//
//  ViewController.m
//  09-上传单个文件
//
//  Created by Peyet-Zhao on 2021/11/6.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#define kBOUNDAREY @"abc"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self uploadFile];
}

- (void)uploadFile {
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/php/upload/upload.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"post";
    [request setValue:[NSString stringWithFormat: @"multipart/form-data; boundary=%@", kBOUNDAREY] forHTTPHeaderField:@"Content-Type"];
    request.HTTPBody = [self getHttpBody];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            NSLog(@"连接错误 %@",connectionError);
            return;
        }
        
        //
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode == 200 || httpResponse.statusCode == 304) {
            //解析数据
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", json);
        }else{
            NSLog(@"服务器内部错误");
        }
    }];
}

- (NSData *)getHttpBody {
//    ------WebKitFormBoundaryuK1d5TsO0QLdfJwB
//    Content-Disposition: form-data; name="userfile"; filename="MyTabBar.m"
//    Content-Type: application/octet-stream
//
//    二进制文件
//    ------WebKitFormBoundaryuK1d5TsO0QLdfJwB--
    
    NSMutableData* mData = [NSMutableData new];
    
    NSMutableString* mString = [NSMutableString stringWithFormat:@"--%@\r\n", kBOUNDAREY];
    [mString appendString:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"ferdowsi.jpg\"\r\n"];
    [mString appendString:@"Content-Type: application/octet-stream\r\n"];
    [mString appendString:@"\r\n"];
    [mData appendData:[mString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"ferdowsi.jpg" ofType:nil];
    NSData* data = [NSData dataWithContentsOfFile:path];
    [mData appendData:data];
    
    NSString* end = [NSString stringWithFormat:@"\r\n--%@--", kBOUNDAREY];
    [mData appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
    
    return mData.copy;
}



@end
