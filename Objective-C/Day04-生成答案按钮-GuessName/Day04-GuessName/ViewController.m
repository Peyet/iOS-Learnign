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

@property (weak, nonatomic) IBOutlet UIView *answerView;
@property (weak, nonatomic) IBOutlet UIView *optionView;

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
    if (_index == self.questions.count) {
        _index = -1;
        [self btnNextClicked:nil];
        self.btnNext.enabled = YES;
        
        // 弹出提示框
//        UIAlertView 'UIAlertView' is deprecated: first deprecated in iOS 9.0 - UIAlertView is deprecated. Use UIAlertController with a preferredStyle of UIAlertControllerStyleAlert instead
//        UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"提示" message:@"恭喜通关🎉" preferredStyle:UIAlertControllerStyleActionSheet];
//        [alertCon addAction:<#(nonnull UIAlertAction *)#>];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"tip" message:@"congradu" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: @"01",nil];
        [alertView show];
        
    } else {
    Question *nextData = self.questions[_index];
    /*
    self.progress.text = [NSString stringWithFormat:@"%d / %lu", self.index+1, self.questions.count];
    self.lblQuestion.text = nextData.title;
        不要这样写, UIImage 有不同的状态, 应使用 setImage
        错误👉self.btnShowImage.imageView.image = [UIImage imageNamed:nextData.icon];
        正确👉[self.btnShowImage setImage:[UIImage imageNamed:nextData.icon] forState:UIControlStateNormal];
    */
    [self setData:nextData];
    sender.enabled = self.index != self.questions.count-1;
    
    
    // 删除上一个按钮创建的btn
    /*
     for (UIButton *btn in [self.answerView subviews]) {
        [btn removeFromSuperview];
    }
     */
    // 让数组的每个元素执行一次这个方法
    [self.answerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    /*
    // 动态创建答案按钮
    NSInteger len =  nextData.answer.length;
    for (int i = 0; i < len; i++) {
        UIButton *btnAnswer = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnAnswer setBackgroundColor:[UIColor systemPinkColor]];
        CGFloat answerMarginX = (double)(414 - 60 * len) / (len + 1);
        CGFloat answerX = answerMarginX + i * (60 + answerMarginX);
        btnAnswer.frame = CGRectMake(answerX , 0, 60, 60);
        [self.answerView addSubview:btnAnswer];
    }
     */
    [self makeAnswerButton:nextData];
    
    
    
    // 创建待选文字按钮
    [self makeOptionsButton:nextData];
}
}

/**
 next按钮中加载模型数据
 */
- (void)setData:(Question *)nextData {
    self.progress.text = [NSString stringWithFormat:@"%d / %lu", self.index+1, self.questions.count];
    self.lblQuestion.text = nextData.title;
    [self.btnShowImage setImage:[UIImage imageNamed:nextData.icon] forState:UIControlStateNormal];
}

/**
 创建 答案按钮
 */
- (void)makeAnswerButton:(Question *)nextData {
    NSInteger len =  nextData.answer.length;
    for (int i = 0; i < len; i++) {
        UIButton *btnAnswer = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnAnswer setBackgroundColor:[UIColor systemPinkColor]];
        CGFloat answerMarginX = (double)(414 - 60 * len) / (len + 1);
        CGFloat answerX = answerMarginX + i * (60 + answerMarginX);
        btnAnswer.frame = CGRectMake(answerX , 0, 60, 60);
        [self.answerView addSubview:btnAnswer];
        
        // 注册答案按钮单击事件
        [btnAnswer addTarget:self action:@selector(btnAnswerClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
}

/**
    清空答案区的按钮文字
 */
- (void)btnAnswerClicked:(UIButton *)sender {
    // 清空答案区的按钮文字
    NSString *charactor = [sender currentTitle];
    [sender setTitle:nil forState:UIControlStateNormal];

    // 恢复待选按钮的文字. 通过比对tag来寻找按钮
    for (UIButton *btn in self.optionView.subviews) {
        if ([sender tag] == [btn tag]) {
            self.optionView.userInteractionEnabled = YES;
            btn.hidden = NO;
            [sender setTag:-1];
            break;
        }
    }
}


/**
  创建待选文字按钮
 */
- (void)makeOptionsButton:(Question *)nextData {
    // 清楚上次的待选文字按钮
    [self.optionView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    // 获取当前待选按钮文字的数组
    NSArray *arrayOfOptions = nextData.options;
    
    // 根据数组创建按钮
    for (int i = 0; i < arrayOfOptions.count; i++) {
        NSString *str = arrayOfOptions[i];
        // 创建待选文字按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        // 设置待选文字按钮背景
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_option"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed: @"btn_option_heighlighted"] forState:UIControlStateHighlighted];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        // 设置待选按钮文字
        [btn setTitle:str forState:UIControlStateNormal];
        
        // 设置按钮的frame
        int countInRow = 7;
        CGFloat btnW = 44;
        CGFloat btnH = 44;
        int marginOfbtn = 10;
        CGFloat marginX = (self.view.frame.size.width - countInRow*btnW - (countInRow-1)*marginOfbtn)/2;
        CGFloat marginY = marginX;
        CGFloat btnX = marginX + (marginOfbtn + btnW) * (i % countInRow);
        CGFloat btnY = marginY + (marginOfbtn + btnH) * (i / countInRow);
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        // 设置按钮的tag
        [btn setTag:i];

        // add button to the superView
        [self.optionView addSubview:btn];
        
        // 为每个选项添加单击事件
        [btn addTarget:self action:@selector(btnOptionsClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    // 设置按钮的数据
}

/**
 待选文字按钮的单击事件
 */
- (void)btnOptionsClicked:(UIButton *)sender {

    

    // 隐藏被点击的按钮
    sender.hidden = YES;

    // 把当前被点击按钮的文字显示到答题区域
//    NSString *str = [sender titleForState:<#(UIControlState)#>]; 获取指定状态下按钮的文字
    for (UIButton *btn in self.answerView.subviews) {
        if ([btn currentTitle] == nil) {
            [btn setTitle:[sender currentTitle] forState:UIControlStateNormal];
            [btn setTag:[sender tag]];
            break;
        }
    }
    
    // 检查答案区域的按钮是否已经满了.已满就禁用optionView
    BOOL isFull = YES;
    for (UIButton *btn in self.answerView.subviews) {
        if ([btn currentTitle] == nil) {
            isFull = NO;
            break;
        }
    }
    if (isFull) {
        self.optionView.userInteractionEnabled = NO;
    }
    
    // 如果答案按钮被填满, 判断用户的答案与标准答案是否相同
    Question *q = self.questions[_index];
    NSMutableString *userAnswer = [NSMutableString new];
    for (UIButton *btn in self.answerView.subviews) {
        if ([btn currentTitle] != nil) {
            [userAnswer appendString:[btn currentTitle]];
        }
    }
    
    // 判断答案是否正确, 以及将要执行的动作
    if (isFull) {
        if ([userAnswer isEqualToString:q.answer]) {
            [self btnNextClicked:nil];
            self.optionView.userInteractionEnabled = YES;
        } else {
            UILabel *lbl = [UILabel new];
            [self.view addSubview:lbl];
            lbl.text = @"the answer is not correct~ please try again";
            lbl.frame = CGRectMake(30, 400, 0, 0);
    //        lbl.backgroundColor = [UIColor greenColor];
            [UIView animateWithDuration:2 animations:^{
                lbl.frame = CGRectMake(30, 400, 350, 30);
                lbl.backgroundColor = [UIColor greenColor];
            } completion:^(BOOL finished) {
                [lbl removeFromSuperview];
            }];
        }
    }
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
