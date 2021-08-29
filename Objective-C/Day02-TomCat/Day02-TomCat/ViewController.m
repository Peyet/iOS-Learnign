//
//  ViewController.m
//  Day02-TomCat
//
//  Created by Peyet-Zhao on 2021/8/29.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewer;
- (IBAction)drink;
- (IBAction)fart:(id)sender;
- (IBAction)knockOut;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)drink {
    [self startAnimatingWithRepeatCount:1 imageName:@"drink" imageNumber:80];
////    加载图片到Array中
//    NSMutableArray *array = [NSMutableArray array];
//    for (int i = 0; i < 81; i++) {
//        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"drink_%02d", i]];
//        [array addObject:img];
//    }
////    设置UIImageView 的animationImages属性
//    self.imageViewer.animationImages = array;
////    设置动画持续时间
//    self.imageViewer.animationDuration = 3.0;
//
//    self.imageViewer.animationRepeatCount = 1;
//
//    [self.imageViewer startAnimating];
////    [self.imageViewer stopAnimating];
}

- (IBAction)fart:(id)sender {
    [self startAnimatingWithRepeatCount:1 imageName:@"fart" imageNumber:27];
//    NSMutableArray *array = [NSMutableArray array];
//    for (int i = 0; i < 28; i++) {
//        [array addObject:[UIImage imageNamed:[NSString stringWithFormat:@"fart_%02d", i]]];
//    }
//    self.imageViewer.animationImages = array;
//    self.imageViewer.animationDuration = 2.0;
//    self.imageViewer.animationRepeatCount = 1;
//    self.imageViewer.startAnimating;
}

- (IBAction)knockOut {
    [self startAnimatingWithRepeatCount:1 imageName:@"knockout" imageNumber:80];
}

- (void)startAnimatingWithRepeatCount:(int)repeatCount imageName:(NSString *)imageName imageNumber:(int)imageNumber {
    if (self.imageViewer.isAnimating) { //判断是否正在执行动画
        return;
    } else {
        //    加载图片到Array中
            NSMutableArray *array = [NSMutableArray array];
            for (int i = 0; i <= imageNumber; i++) {
                
                //+ (UIImage *)imageNamed:(NSString *)name;  类方法会将用到的图片都加载到内存中, 会消耗大量的资源
                  UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%@_%02d", imageName, i]];

                //使用+ (UIImage *)imageWithContentsOfFile:(NSString *)path 不会将使用过的图片加载到内存中, 从硬盘中直接读取
                //UIImage *img = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:@".jpg"]];


                //NSLog(@"%@", [NSString stringWithFormat:@"%@_%02d", imageName, i]);
                [array addObject:img];
            }
        //    设置UIImageView 的animationImages属性
            self.imageViewer.animationImages = array;
        //    设置动画持续时间
            self.imageViewer.animationDuration = 5.0;
            
            self.imageViewer.animationRepeatCount = repeatCount;
            
            [self.imageViewer startAnimating];
        //    [self.imageViewer stopAnimating];
        [self.imageViewer performSelector:@selector(animation) withObject:nil afterDelay:3];
        }
}
@end
