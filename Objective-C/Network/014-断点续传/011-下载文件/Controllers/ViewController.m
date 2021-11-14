//
//  ViewController.m
//  011-下载文件
//
//  Created by Peyet-Zhao on 2021/11/8.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "FileDownloader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    FileDownloader* fileDownloader = [FileDownloader new];
//    [fileDownloader download:@"http://127.0.0.1/abc.exe"];
    [fileDownloader download:@"http://127.0.0.1/abc.exe" successBlock:^(NSString * _Nonnull path) {
        NSLog(@"下载完成!已保存到:%@", path);
    } processBlock:^(float process) {
        NSLog(@"process : %lld", process);
    } errorBlock:^(NSError * _Nonnull error) {
        NSLog(@"出错啦 : %@", error);
    }];
}


@end
