//
//  ViewController.m
//  Day01-ButtonUsage
//
//  Created by Peyet-Zhao on 2021/8/28.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)move:(UIButton *)sender;

- (IBAction)scale:(UIButton *)sender;



//- (IBAction)clickUp;
//- (IBAction)down;
//- (IBAction)left:(id)sender;
//- (IBAction)right;
@property (weak, nonatomic) IBOutlet UIButton *clickMe;
//- (IBAction)plus;
//- (IBAction)minus;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//  为每个按钮设置不同的tag值, 根据sender.tag 就可以判断哪个按钮被点击了.
- (IBAction)move:(UIButton *)sender {
    NSLog(@"move");
    CGRect originFrame = self.clickMe.frame;
    
    switch (sender.tag) {
        case 1:
            originFrame.origin.y -= 10;
            break;
        case 2:
            originFrame.origin.x -= 10;
            break;
        case 3:
            originFrame.origin.y += 10;
            break;
        case 4:
            originFrame.origin.x += 10;
            break;
            }
    self.clickMe.frame = originFrame;
}

- (IBAction)scale:(UIButton *)sender {
    NSLog(@"scale");
    CGRect originFrame = self.clickMe.frame;
    
    switch (sender.tag) {
        case 5:
            originFrame.size.height += 10;
            originFrame.size.width += 10;
            break;
        case 6:
            originFrame.size.height -= 10;
            originFrame.size.width -= 10;
            break;
    }
    self.clickMe.frame = originFrame;
}

//- (IBAction)clickUp {
//    NSLog(@"up");
////    获取frame值, 包含位置和大小信息
//    CGRect originFrame = self.clickMe.frame;
//    originFrame.origin.y -= 10;
//
//    self.clickMe.frame = originFrame;
//}
//
//- (IBAction)down {
//    NSLog(@"down");
//    CGRect originFrame = self.clickMe.frame;
//    originFrame.origin.y += 10;
//
//    self.clickMe.frame = originFrame;
//}
//
//- (IBAction)left:(id)sender {
//    NSLog(@"left");
//    CGRect originFrame = self.clickMe.frame;
//    originFrame.origin.x -= 10;
//
//    self.clickMe.frame = originFrame;
//
//}
//
//- (IBAction)right {
//    NSLog(@"right");
//    CGRect originFrame = self.clickMe.frame;
//    originFrame.origin.x += 10;
//    self.clickMe.frame = originFrame;
//}
//- (IBAction)plus {
//    NSLog(@"plus");
//    CGRect sizeFrame = self.clickMe.frame;
//    sizeFrame.size.height += 10;
//    sizeFrame.size.width += 10;
//    self.clickMe.frame = sizeFrame;
//
//}
//
//- (IBAction)minus {
//    NSLog(@"minus");
//    CGRect sizeFrame = self.clickMe.frame;
//    sizeFrame.size.height -= 10;
//    sizeFrame.size.width -= 10;
//    self.clickMe.frame = sizeFrame;
//
//}
@end
