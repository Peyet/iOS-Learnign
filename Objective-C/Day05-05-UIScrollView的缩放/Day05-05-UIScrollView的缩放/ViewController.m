//
//  ViewController.m
//  Day05-05-UIScrollView的缩放
//
//  Created by Peyet-Zhao on 2021/9/9.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    NSLog(@"zooming....");
    return self.imageView;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
    NSLog(@"will begin zooming");
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    NSLog(@"did zoom");
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    NSLog(@"did end zooming");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.contentSize = self.imageView.image.size;
    self.scrollView.delegate = self;
    self.scrollView.maximumZoomScale = 5;   // 最大缩放比例
    self.scrollView.minimumZoomScale = 0.3; // 最小缩放比例
}


@end
