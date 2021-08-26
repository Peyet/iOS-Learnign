//
//  ViewController.m
//  Day01-AdditionCaculator
//
//  Created by Peyet-Zhao on 2021/8/25.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)compute;
@property (weak, nonatomic) IBOutlet UITextField *textFieldNumber1;
@property (weak, nonatomic) IBOutlet UITextField *textFieldNumber2;
@property (weak, nonatomic) IBOutlet UILabel *lblResult;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)compute {
    NSLog(@"click caculate button : compute");
    // 获取输入信息
    NSString *str1 = self.textFieldNumber1.text;
    NSString *str2 = self.textFieldNumber2.text;
    double number1 = str1.doubleValue;
    double number2 = str2.doubleValue;
    //计算
    double result = number1 + number2;
    //展示结果
    self.lblResult.text = [NSString stringWithFormat:@"%.2lf", result];
//    //召回键盘
//    //由 第一响应者召 回     (resign 辞职)
//    [self.textFieldNumber2 resignFirstResponder];
    
    [self.view endEditing:YES];
}
@end
