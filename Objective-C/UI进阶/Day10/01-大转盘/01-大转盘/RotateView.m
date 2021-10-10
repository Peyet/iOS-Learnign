//
//  RotateView.m
//  01-大转盘
//
//  Created by Peyet-Zhao on 2021/10/10.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "RotateView.h"

@interface RotateView ()

@property (weak, nonatomic) IBOutlet UIImageView *imageRotate;
@property (nonatomic, strong) UIButton* currentButton;

@end

@implementation RotateView

+ (instancetype)rotateView {
    return [[NSBundle mainBundle] loadNibNamed:@"RotateView" owner:nil options:nil][0];
}
 

- (void)awakeFromNib {
    [super awakeFromNib];
    for (int i = 0; i < 12; i++) {
        UIButton* button = [UIButton new];
//        button.backgroundColor = UIColor.redColor;
        
        UIImage* sourceImage = [UIImage imageNamed:@"LuckyAstrology"];
        [button setImage:[self clipImageWithImage:sourceImage withIndex:i] forState:UIControlStateNormal];

        UIImage* sourcePressImage = [UIImage imageNamed:@"LuckyAstrologyPressed"];
        [button setImage:[self clipImageWithImage:sourcePressImage withIndex:i] forState:UIControlStateSelected];
        
        [button setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        
        // button的内边距
        [button setImageEdgeInsets:UIEdgeInsetsMake(-50, 0, 0, 0)];
        
        [self.imageRotate addSubview:button];
        button.userInteractionEnabled = YES;
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)buttonClicked:(UIButton *)sender {
    
    self.currentButton.selected  = NO;
    
    sender.selected = YES;
    self.currentButton = sender;
    NSLog(@"selected");
}

// 布局子控件的位置
- (void)layoutSubviews {
    [super layoutSubviews];
    for (int i = 0; i < self.imageRotate.subviews.count; i++) {
        UIButton* button = self.imageRotate.subviews[i];
        button.bounds = CGRectMake(0, 0, 68, 143);
        button.center = self.imageRotate.center;

        button.layer.anchorPoint  = CGPointMake(0.5, 1);
        button.transform = CGAffineTransformMakeRotation(2*M_PI/12 * i);
    }
}

- (UIImage *)clipImageWithImage:(UIImage *)image withIndex:(NSInteger)index {
    
    CGFloat w = image.size.width / 12.0 * [UIScreen mainScreen].scale * 2/3.0,
    h = image.size.height * [UIScreen mainScreen].scale* 2/3.0,
    x = index * image.size.width / 12.0 * [UIScreen mainScreen].scale* 2/3.0,
    y = 0;
    
//    y =  [UIScreen mainScreen].scale;
    CGImageRef cgImage = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(x, y, w, h));
    
    return [[UIImage alloc] initWithCGImage:cgImage scale:2 orientation:UIImageOrientationUp];
}

@end
