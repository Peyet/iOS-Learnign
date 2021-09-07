//
//  ViewController.m
//  Day05-01-UIScrollView-大图滚动展示
//
//  Created by Peyet-Zhao on 2021/9/7.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 告诉UIScrollView , imageView的大小是多少
    // 1. imageView的大小
    // self.scrollView.contentSize = self.imageView.frame.size;
    
    // 2. imageView中image的大小
    self.scrollView.contentSize = self.imageView.image.size;
}


@end
