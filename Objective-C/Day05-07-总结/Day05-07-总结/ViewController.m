//
//  ViewController.m
//  Day05-07-总结
//
//  Created by Peyet-Zhao on 2021/9/9.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewWelcome;
- (IBAction)NEXT:(id)sender;
- (IBAction)DONE:(id)sender;
@property (nonatomic, strong) UIScrollView *banner;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWelcomePage];
}

/**
 切换welcome背景颜色  or  control pageView
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    // welcome scrollView
    CGFloat offset = self.scrollViewWelcome.contentOffset.x;
    CGFloat width = self.view.frame.size.width ;
    UIColor *color;
    if (offset < 200) {
         color= [UIColor systemPinkColor];
    } else {
        color = [UIColor systemIndigoColor];
    }
    NSLog(@"%f", offset);
    [UIView animateWithDuration:0.6 animations:^{
        self.scrollViewWelcome.backgroundColor = color;
    }];
    
    // UserInterface scrollView
    CGFloat bannerOffset = self.banner.contentOffset.x;
    int nextPage = bannerOffset / 300 + 1;
    self.pageControl.currentPage = nextPage;
    
    
}

/**
 初始化欢迎界面
 */
- (void)initWelcomePage {
    self.scrollViewWelcome.contentSize = CGSizeMake(828, 896);
    self.scrollViewWelcome.pagingEnabled = YES;
    self.scrollViewWelcome.showsHorizontalScrollIndicator = NO;
    
    self.scrollViewWelcome.delegate = self;
    

}

/**
 Remove welcome page
 */
- (IBAction)NEXT:(id)sender {
    self.scrollViewWelcome.contentOffset =CGPointMake(self.scrollViewWelcome.frame.size.width, 0);
    [UIView animateWithDuration:0.6 animations:^{
        self.scrollViewWelcome.backgroundColor = [UIColor systemPinkColor];
    }];
}

- (IBAction)DONE:(id)sender {
    [self.scrollViewWelcome removeFromSuperview];
    
    [self initUserInterface];
}

/**
 初始化用户界面
 */
- (void)initUserInterface {
    // 创建UIScrollView及初始化
    self.banner = [[UIScrollView alloc] initWithFrame:CGRectMake(57, 64, 300, 130)];
    self.banner.contentSize = CGSizeMake(300 * 5, 0);
    for (int i = 0; i < 5; i++) {
        NSString *strImg = [NSString stringWithFormat:@"img_%02d", i+1];
        UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed: strImg]];
        img.frame = CGRectMake(i * 300, 0, 300, 130);
        [self.banner addSubview:img];
    }
    self.banner.pagingEnabled = YES;
    self.banner.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.banner];
    self.banner.delegate = self;
    
    // 创建banner
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(157, 174, 100, 10)];
    pageControl.numberOfPages = 5;
    pageControl.currentPage = 0;
    pageControl.pageIndicatorTintColor = [UIColor systemGreenColor];
    pageControl.currentPageIndicatorTintColor = [UIColor systemRedColor];
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    
    // 创建电台
    UIScrollView *VertiScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.banner.frame), 414, 702)];
    
//    VertiScrollView.backgroundColor = [UIColor systemGreenColor];
    
    VertiScrollView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    
//    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"f1"]];
//    img.frame = CGRectMake(0, 0, 1600, 1200);
//
//    VertiScrollView.contentSize = img.image.size;
//    [VertiScrollView addSubview:img];
    
    
    for (int i = 0; i<10; i++) {
        UIImageView *imags = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"finditem_hotsound"]];
        imags.frame = CGRectMake(52+(i%2)*(145+20), 20 + i/2 * (145+20), 145, 145);
        [VertiScrollView addSubview:imags];
    }
    
    NSArray *arr = VertiScrollView.subviews;
    
    VertiScrollView.contentSize = CGSizeMake(0, 825);
    VertiScrollView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:VertiScrollView];
}
@end
