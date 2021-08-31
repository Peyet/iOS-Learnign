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

@end
