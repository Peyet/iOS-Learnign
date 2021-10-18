//
//  ViewController.m
//  02-异步下载网络图片
//
//  Created by Peyet-Zhao on 2021/10/18.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadImage];
}

- (void)loadView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.scrollView;
    
    self.imageView = [UIImageView new];
    [self.view addSubview:self.imageView];
}

- (void)loadImage {
    NSURL* url = [NSURL URLWithString:@"https://www.wahaotu.com/uploads/allimg/201904/1555074510295049.jpg"];
    NSData* data = [NSData dataWithContentsOfURL:url];
    UIImage* image = [UIImage imageWithData:data];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imageView.image = image;
        [self.imageView sizeToFit];
        self.scrollView.contentSize = image.size;
    });
}


@end
