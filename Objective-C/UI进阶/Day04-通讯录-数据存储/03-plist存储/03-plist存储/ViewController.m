//
//  ViewController.m
//  03-plist存储
//
//  Created by Peyet-Zhao on 2021/10/1.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)save:(id)sender {
    
        // 获取document 路径
        // 1.1 拼接字符串
    //    NSString *homePath = NSHomeDirectory();
    //    NSString *docPath = [homePath stringByAppendingString:@"/Documents"];
    //    NSLog(@"%@", docPath);
        // 1.2 stringByAppendingPathComponent: 不需要加 /
    //    NSString *homePath = NSHomeDirectory();
    //    NSString *docPath = [homePath stringByAppendingPathComponent:@"Documents"];
    //    NSLog(@"%@", docPath);
        
        // 2. 搜索的形式
        // NSSearchPath  搜索路径 ForDirectories  搜索的文件夹 InDomains 搜索的区域
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask, YES)[0];
    
    NSLog(@"docPath : %@", docPath);
    
        NSString *fileName = [docPath stringByAppendingString:@"/xx.plist"];
    
    NSLog(@"docPath : %@", fileName);

    // 数组
//        NSArray *arr = @[@"12", @"123"];
//        [arr writeToFile:fileName atomically:YES];
    
    // 字典
    NSDictionary *dict = @{@"key":@"value"};
    [dict writeToFile:fileName atomically:YES];

}


- (IBAction)read:(id)sender {
    // 获取 doc 目录
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [docPath stringByAppendingPathComponent:@"xx.plist"];
    
    // 数组
//    NSArray *arr = [NSArray arrayWithContentsOfFile:filePath];
    // 字典
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    NSLog(@"%@", dict);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@", NSHomeDirectory());
    
}


@end
