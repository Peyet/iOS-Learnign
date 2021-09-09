//
//  ViewController.m
//  Day05-06-实现横向滚动
//
//  Created by Peyet-Zhao on 2021/9/9.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int page = self.scrollView.contentOffset.x / 300;
    self.pageControl.currentPage = page;
}

/**
 即将拖拽的时候停止计时器
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    // 停止计时器.
    // 调用invalidare 停止计时器, 这个计时器就不可以被重用了. 再次使用得创建一个新的计时器
    [self.timer invalidate];
    
    self.timer = nil;
}

/**
 停止拖拽的时候开始计时器
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    // 重新创建一个新的计时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 动态创建imageView
    CGFloat viewW = 300, viewH = 130;
    for (int i = 0; i < 5; i++) {
        NSString *img = [NSString stringWithFormat:@"img_0%d", i+1];
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:img]];
        
        CGFloat viewX = 300*i, viewY = 0;
        imgView.frame = CGRectMake(viewX, viewY, viewW, viewH);
        
        [self.scrollView addSubview:imgView];
    }
    self.scrollView.contentSize = CGSizeMake(viewW*5, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    // 实现scrollView 的分页效果
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    
    
    
    // 设置分页显示器
    // 设置总页数
    self.pageControl.numberOfPages = 5;
    // 设置当前页
    self.pageControl.currentPage = 0;
     
    
    // 添加计时器 实现图片的轮播
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
}

/**
 自动滚动图片
 */
- (void)scrollImage {
    NSLog(@"timer was started....");
    NSInteger totalPage = self.pageControl.numberOfPages;
    NSInteger nextPage = (self.pageControl.currentPage + 1) % totalPage;
    CGFloat OffsetX = nextPage * self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:CGPointMake(OffsetX, 0) animated:YES];
    self.pageControl.currentPage = nextPage;
}

@end
