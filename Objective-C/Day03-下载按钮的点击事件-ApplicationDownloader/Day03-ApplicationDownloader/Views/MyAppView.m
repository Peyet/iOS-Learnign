//
//  MyAppView.m
//  Day03-ApplicationDownloader
//
//  Created by Peyet-Zhao on 2021/8/31.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "MyAppView.h"
#import "MyApp.h"

@interface MyAppView ()
@property (weak, nonatomic) IBOutlet UIImageView *imgViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIButton *btnDownload;
- (IBAction)btnDownloadClick:(UIButton *)sender;

@end

@implementation MyAppView

// 重写model的set方法
- (void)setModel:(MyApp *)model {
    //先赋值
    _model = model;
    //解析数据
    self.imgViewIcon.image = [UIImage imageNamed:self.model.icon];
    self.lblName.text = self.model.name;
}

+ (instancetype)appView {
    // 获取xib文件 (当xib文件部署到手机上的时候, 就会变成*.nib)
    MyAppView *appView = [[[NSBundle mainBundle] loadNibNamed:@"MyApp" owner:nil options:nil] firstObject];
    
    return appView;
}

- (IBAction)btnDownloadClick:(UIButton *)sender {
    // 禁用当前被点击的按钮
    sender.enabled = NO;
    // 弹出一个消息提醒框(是UILabel实现的)
    UILabel *lblMsg = [[UILabel alloc] init];
    lblMsg.text = @"Downloading...";
    lblMsg.backgroundColor = [UIColor systemPinkColor];
    lblMsg.frame = CGRectMake(107, 435, 200, 30);
    lblMsg.textAlignment = NSTextAlignmentCenter;
    lblMsg.font = [UIFont boldSystemFontOfSize:17];
    
    // 设置label 的圆角边
    lblMsg.layer.cornerRadius = 10;
    lblMsg.layer.masksToBounds = YES;
    
    //  设置透明度 先设置为0, 然后调用animation动画慢慢调整至0.6
//    lblMsg.alpha = 0.6;
    lblMsg.alpha = 0;
//    [UIView animateWithDuration:1 animations:^{
//        lblMsg.alpha = 0.6;
//    }];
    [UIView animateWithDuration:1.5 animations:^{
        lblMsg.alpha = 0.6;
    } completion:^(BOOL finished) {
        if (finished) {
            //            隔一段时间在启动另一个动画
            [UIView animateWithDuration:1.5 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
                lblMsg.alpha = 0;
            } completion:^(BOOL finished) {
                if (finished) {
                    [lblMsg removeFromSuperview];
                }
            }];
        }
    }];
    
    // 将label 加到控制器所控制的大view上
    [self.superview addSubview:lblMsg];
    
}
@end
