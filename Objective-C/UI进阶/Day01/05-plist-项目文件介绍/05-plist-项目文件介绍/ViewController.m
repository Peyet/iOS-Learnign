//
//  ViewController.m
//  05-plist-项目文件介绍
//
//  Created by Peyet-Zhao on 2021/9/27.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDictionary *dict = [NSBundle mainBundle].infoDictionary;
    NSLog(@"%@", dict);
    
    // prefixHeader
//    ToolForCaculate
}


@end
