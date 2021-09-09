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

@end

@implementation ViewController

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int page = self.scrollView.contentOffset.x / 300;
    self.pageControl.currentPage = page;
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
     
    
}


@end
