//
//  ViewController.m
//  Day01-TransformProperty
//
//  Created by Peyet-Zhao on 2021/8/28.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)translation; //平移
- (IBAction)scale;      //缩放
- (IBAction)rotate;      //旋转
@property (weak, nonatomic) IBOutlet UIButton *btn;

- (IBAction)goBack;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)translation {
//    self.btn.transform = CGAffineTransformMakeTranslation(0, -50);  //平移的距离为相对原来第一次的, 只平移一次
//    ⬇️基于上一次的位置平移, 可以平移多次
    self.btn.transform = CGAffineTransformTranslate(self.btn.transform, 0, -50);
}

- (IBAction)scale {
//    缩放
//    self.btn.transform = CGAffineTransformMakeScale(1.5, 1.5); // 同理平移, 只缩放一次
    self.btn.transform = CGAffineTransformScale(self.btn.transform, 1.5, 1.5);
}

- (IBAction)rotate {
//    self.btn.transform = CGAffineTransformMakeRotation(M_PI_4);  //参数弧度
    self.btn.transform = CGAffineTransformRotate(self.btn.transform, M_PI_4);
}
- (IBAction)goBack {
//    回到初始状态
    self.btn.transform = CGAffineTransformIdentity;
}
@end
