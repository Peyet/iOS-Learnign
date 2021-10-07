//
//  ViewController.m
//  04-手势解锁
//
//  Created by Peyet-Zhao on 2021/10/6.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "ButtonView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet ButtonView *passwordView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Home_refresh_bg"]];
    self.passwordView.passwordBlock = ^BOOL(NSString * pwd) {
        if ([pwd isEqualToString:@"012"]) {
            //
            NSLog(@"正确");
            return YES;
        }
        else {
            NSLog(@"错误");
            return NO;
        }
    };
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
