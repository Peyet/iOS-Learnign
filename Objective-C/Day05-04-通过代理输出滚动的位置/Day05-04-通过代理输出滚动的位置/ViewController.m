//
//  ViewController.m
//  Day05-04-通过代理输出滚动的位置
//
//  Created by Peyet-Zhao on 2021/9/8.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

/**
    通过代理监听滚动事件的步骤
    1. 创建delegate对象 (一般都是本控制器来作为代理对象)
        self.scrollView.delegate = self;
    2. 设置UIScrollView中delegate属性的值
    3. 让delegate对象遵守 对应空间的协议. 一般控件的代理协议命名规则都是: 控件名Delegate
    4.  在代理对象中实现对应的方法
 */

@implementation ViewController

/**
 即将开始拖拽
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"即将开始i拖拽");
}

/**
 正在滚动
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSString *strOfLocation = NSStringFromCGPoint(scrollView.contentOffset);
    NSLog(@"%@", strOfLocation);
}

/**
 停止拖拽
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"拖拽完毕");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollView.contentSize = self.imageView.frame.size;
    
    self.scrollView.delegate = self;
}


@end
