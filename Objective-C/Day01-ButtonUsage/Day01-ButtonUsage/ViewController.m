//
//  ViewController.m
//  Day01-ButtonUsage
//
//  Created by Peyet-Zhao on 2021/8/28.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)clickUp;
- (IBAction)down;
- (IBAction)left:(id)sender;
- (IBAction)right;
@property (weak, nonatomic) IBOutlet UIButton *clickMe;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)clickUp {
    NSLog(@"up");
//    获取frame值, 包含位置和大小信息
    CGRect originFrame = self.clickMe.frame;
    originFrame.origin.y -= 10;
    
    self.clickMe.frame = originFrame;
}

- (IBAction)down {
    NSLog(@"down");
    CGRect originFrame = self.clickMe.frame;
    originFrame.origin.y += 10;
    
    self.clickMe.frame = originFrame;
}

- (IBAction)left:(id)sender {
    NSLog(@"left");
    CGRect originFrame = self.clickMe.frame;
    originFrame.origin.x -= 10;
    
    self.clickMe.frame = originFrame;

}

- (IBAction)right {
    NSLog(@"right");
    CGRect originFrame = self.clickMe.frame;
    originFrame.origin.x += 10;
    self.clickMe.frame = originFrame;
}
@end
