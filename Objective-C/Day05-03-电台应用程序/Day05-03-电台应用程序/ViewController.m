//
//  ViewController.m
//  Day05-03-电台应用程序
//
//  Created by Peyet-Zhao on 2021/9/8.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *lastImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 获取内容的最大的Y值
//    CGFloat MaxY = self.lastImageView.frame.origin.y + self.lastImageView.frame.size.height;
    CGFloat maxY = CGRectGetMaxY(self.lastImageView.frame);
    self.scrollView.contentSize = CGSizeMake(0, maxY);
    
    // 设置默认的偏移位置
    self.scrollView.contentOffset = CGPointMake(0, -66);
    
    // 设置内边距
    self.scrollView.contentInset = UIEdgeInsetsMake(66, 0, 56, 0);
}


@end
