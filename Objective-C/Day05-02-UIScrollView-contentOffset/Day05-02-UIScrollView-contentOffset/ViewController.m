//
//  ViewController.m
//  Day05-02-UIScrollView-contentOffset
//
//  Created by Peyet-Zhao on 2021/9/7.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)scroll:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollView.contentSize = self.imageView.image.size;
    
    // 隐藏滚动指示器
    // ⬇️设置水平指示器隐藏
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    
    
    // 设置 内容的内边距
    self.scrollView.contentInset = UIEdgeInsetsMake(100, 50, 30, 10);
}


- (IBAction)scroll:(id)sender {
    CGPoint point = self.scrollView.contentOffset;
    point.x += 100;
    point.y += 100;
    // 直接修改contentOffset 没有动画效果
    // self.scrollView.contentOffset = point;
    
    // 通过 animate... 函数实现滚动动画
    /*
    [UIView animateWithDuration:1 animations:^{
        self.scrollView.contentOffset = point;
    }];
     */
    
    // 使用类自带的方法实现动画效果
    [self.scrollView setContentOffset:point animated:YES];

}
@end
