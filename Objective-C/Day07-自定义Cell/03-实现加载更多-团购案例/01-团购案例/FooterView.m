//
//  FooterView.m
//  01-团购案例
//
//  Created by Peyet-Zhao on 2021/9/13.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "FooterView.h"

@interface FooterView ()
@property (weak, nonatomic) IBOutlet UIButton *btnLoadMore;
@property (weak, nonatomic) IBOutlet UIView *viewWaiting;
- (IBAction)btnclickLoadMore:(UIButton *)sender;

@end

@implementation FooterView


- (IBAction)btnclickLoadMore:(UIButton *)sender {
    // 隐藏“加载更多”按钮
    self.btnLoadMore.hidden = YES;
    
    // 显示“”等待指示器"的view
    self.viewWaiting.hidden = NO;
    
    
    // 延时
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 调用代理实现下面的功能
        // 增加一条数据
        // ..1创建一个模型对象
        // ..2把模型对象驾到控制器的goods集合中
        // 调用协议中的方法为了保证不出错, 要先判断一下代理对象是否实现了必须要实现的方法. 没有则不掉用
        if ([self.delegate respondsToSelector:@selector(footerViewUpdateData:)]) {
            [self.delegate footerViewUpdateData:self];
        }
        self.btnLoadMore.hidden = NO;
        self.viewWaiting.hidden = YES;
    });
}

+ (instancetype)footerView {
    return [[[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:nil options:nil] firstObject];

}
@end
