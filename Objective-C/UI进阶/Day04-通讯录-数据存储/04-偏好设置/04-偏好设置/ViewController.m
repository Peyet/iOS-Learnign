//
//  ViewController.m
//  04-偏好设置
//
//  Created by Peyet-Zhao on 2021/10/2.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)save:(id)sender {
    // 1. 不需要关心文件夹和文件的名字
    // 2. 快速做键值对
    // 3. 用法和字典一样
    
    // 存数据
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:@"value" forKey:@"key"];
    [ud setBool:YES forKey:@"isOn"];
    
}
- (IBAction)read:(id)sender {
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSLog(@"%@", [ud objectForKey:@"key"]);
    NSLog(@"%d", [ud boolForKey:@"isOn"]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
