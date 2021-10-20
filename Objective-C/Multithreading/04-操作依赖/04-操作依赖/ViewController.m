//
//  ViewController.m
//  04-操作依赖
//
//  Created by Peyet-Zhao on 2021/10/20.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation ViewController

- (NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [NSOperationQueue new];
    }
    return _queue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSBlockOperation* op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载");
    }];
    
    NSBlockOperation* op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"解压");
    }];
    
    NSBlockOperation* op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"完成");
    }];
    
    [op2 addDependency:op1];
    [op3 addDependency:op2];
    
    [self.queue addOperations:@[op1, op2] waitUntilFinished:NO];
    
    // 依赖可以跨队列
    [[NSOperationQueue mainQueue] addOperation:op3];
    
}

@end
