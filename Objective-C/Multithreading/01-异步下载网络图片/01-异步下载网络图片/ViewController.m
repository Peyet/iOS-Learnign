//
//  ViewController.m
//  01-异步下载网络图片
//
//  Created by Peyet-Zhao on 2021/10/15.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)loadView {
    self.scrollView = [UIScrollView new];
    self.view = self.scrollView;

    self.imageView = [UIImageView new];
    [self.scrollView addSubview:self.imageView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSThread* thread = [[NSThread alloc] initWithTarget:self selector:@selector(downloadImage) object:nil];
    [thread start];
}

// 下载网络图片
- (void)downloadImage {
    NSURL* imageUrl = [NSURL URLWithString:@"https://www.wahaotu.com/uploads/allimg/201904/1555074510295049.jpg"];
    
    NSData* image = [NSData dataWithContentsOfURL:imageUrl];
        
    [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:NO];
}

- (void)updateUI:(NSData *)image {
    self.imageView.image = [UIImage imageWithData:image];
    [self.imageView sizeToFit];
    self.scrollView.contentSize = self.imageView.frame.size;
}

@end
