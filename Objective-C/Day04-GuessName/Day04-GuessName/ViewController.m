//
//  ViewController.m
//  Day04-GuessName
//
//  Created by Peyet-Zhao on 2021/9/1.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "Question.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *questions;

@property (nonatomic, assign) int index;

@property (weak, nonatomic) IBOutlet UILabel *progress;
@property (weak, nonatomic) IBOutlet UIButton *score;
@property (weak, nonatomic) IBOutlet UILabel *lblQuestion;
@property (weak, nonatomic) IBOutlet UIButton *btnShowImage;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;

// 阴影按钮的button
@property (weak, nonatomic) UIButton *btnCover;


@property (nonatomic, assign) CGRect iconFrame;


- (IBAction)btnNextClicked:(UIButton *)sender;
- (IBAction)btnBigPicture:(UIButton *)sender;
- (IBAction)btnClickBigImag:(UIButton *)sender;

@end

@implementation ViewController

- (NSArray *)questions {
    if (_questions == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"questions.plist" ofType:nil];
        NSArray *arrayOfDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *array = [NSMutableArray new];
        for (NSDictionary *dict in arrayOfDict) {
            [array addObject:[Question questionWithDict:dict]];
        }
        self.questions = array;
    }
//    return self.questions;  不可以使用self 语句返回, 应使用_question. 因为self 会继续调用@question属性的set方法, 陷入死循环
    return _questions;
}

- (IBAction)btnNextClicked:(UIButton *)sender {
    NSLog(@"btnClick");
    self.index++;
    Question *nextData = self.questions[_index];
    self.progress.text = [NSString stringWithFormat:@"%d / %lu", self.index+1, self.questions.count];
    self.lblQuestion.text = nextData.title;
    
    /*
        不要这样写, UIImage 有不同的状态, 应使用 setImage
        self.btnShowImage.imageView.image = [UIImage imageNamed:nextData.icon];
     */
    [self.btnShowImage setImage:[UIImage imageNamed:nextData.icon] forState:UIControlStateNormal];
    
    sender.enabled = self.index != self.questions.count-1;
}

- (IBAction)btnBigPicture:(UIButton *)sender {
    // 保存头像大小的原始数据
    self.iconFrame = self.btnShowImage.frame;
    // 创建一个与手机大小的button , 并且设置阴影
    UIButton *btnbackground = [UIButton buttonWithType:UIButtonTypeCustom];
    // 与属性的btnCover绑定
    self.btnCover = btnbackground;
    [btnbackground setBackgroundColor:[UIColor blackColor]];
    [btnbackground setAlpha:0];
    btnbackground.frame = self.view.bounds;
    [self.view addSubview:btnbackground];
    
    // 将图片设置到button的上面
    [self.view bringSubviewToFront:self.btnShowImage];
    
    // 通过动画吧图片变大
    CGFloat iconW = self.view.frame.size.width;
    CGFloat iconH = iconW;
    CGFloat iconX = 0;
    CGFloat iconY = (self.view.frame.size.height - iconH ) /2;
    
    [UIView animateWithDuration:1 animations:^{
        _btnShowImage.frame = CGRectMake(iconX, iconY, iconW, iconH);
        [btnbackground setAlpha:0.7];
    }];
    
    // 为阴影按钮注册一个单击事件
    [btnbackground addTarget:self action:@selector(btnBackgroundClick) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)btnClickBigImag:(UIButton *)sender {
    if (self.btnCover == nil) {
        [self btnBigPicture:nil];
    } else {
        [self btnBackgroundClick];
    }
}

- (void)btnBackgroundClick {
//    NSLog(@"dddd");
    // 设置阴影的透明度为0, 将图片还原为原来的大小 移除阴影按钮
    [UIView animateWithDuration:1 animations:^{
        // 还原图像大小
        self.btnCover.alpha = 0;
        self.btnShowImage.frame = self.iconFrame;
    } completion:^(BOOL finished) {
        [self.btnCover removeFromSuperview];
        self.btnCover = nil;
    }];
}
/*
// 设置状态栏的颜色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

// 隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
}
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.index = -1;
    [self btnNextClicked:nil];
}


@end
