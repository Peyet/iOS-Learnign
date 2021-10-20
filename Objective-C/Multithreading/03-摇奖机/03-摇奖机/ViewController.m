//
//  ViewController.m
//  03-摇奖机
//
//  Created by Peyet-Zhao on 2021/10/20.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *one;
@property (weak, nonatomic) IBOutlet UILabel *two;
@property (weak, nonatomic) IBOutlet UILabel *three;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

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
}

- (IBAction)start:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"暂停"]) {
        [sender setTitle:@"开始" forState:UIControlStateNormal];
        [self.queue setSuspended:YES];
    }else {
        [self.queue setSuspended:NO];
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
        if (self.queue.operationCount == 0) {
            [self.queue addOperationWithBlock:^{
                [self random];
            }];
        }
    }
}

- (void)random {
    while (!self.queue.isSuspended) {
        [NSThread sleepForTimeInterval:0.05];
        int number1 = arc4random_uniform(10);
        int number2 = arc4random_uniform(10);
        int number3 = arc4random_uniform(10);
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.one.text = [NSString stringWithFormat:@"%d", number1];
        self.two.text = [NSString stringWithFormat:@"%d", number2];
        self.three.text = [NSString stringWithFormat:@"%d", number3];
        }];

    }
}

@end
