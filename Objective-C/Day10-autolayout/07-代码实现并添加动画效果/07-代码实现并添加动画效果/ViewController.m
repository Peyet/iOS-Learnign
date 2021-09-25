//
//  ViewController.m
//  07-代码实现并添加动画效果
//
//  Created by Peyet-Zhao on 2021/9/25.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewOfPink;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewOfPinkTop;
- (IBAction)btnClicked:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}


- (IBAction)btnClicked:(UIButton *)sender {
    self.viewOfPink.constant += 10;
    self.viewOfPinkTop.constant += 200;
    
    [UIView animateWithDuration:3 animations:^{
        [self.myView layoutIfNeeded];
    }];
}
@end
