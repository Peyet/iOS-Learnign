//
//  ViewController.m
//  04-日期选择-datePicker
//
//  Created by Peyet-Zhao on 2021/9/27.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;


// 懒加载控件
@property (nonatomic, strong) UIDatePicker *datePicker;

@property (nonatomic, strong) UIToolbar *toolBar;


@end

@implementation ViewController

#pragma mark - 懒加载控件
 
- (UIDatePicker *)datePicker {
    if (_datePicker == nil) {
        _datePicker =[[UIDatePicker alloc] init];
        // 设置datePicker的模式--日期模式
        self.datePicker.datePickerMode = UIDatePickerModeDate;
        // 本地化 locale
        self.datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-Hans"];
        
    }
    return _datePicker;
}

- (UIToolbar *)toolBar {
    if (_toolBar == nil) {
        _toolBar = [[UIToolbar alloc] init];
        // 只需要高度
        _toolBar.bounds = CGRectMake(0, 0, 0, 44);
        
        // 创建barButton按钮 到toolBar中
        //cancel
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(btnClickedOfCancel)];
        // confirm
        UIBarButtonItem *confirmItem = [[UIBarButtonItem alloc] initWithTitle:@"确认" style:UIBarButtonItemStylePlain target:self action:@selector(btnClickedOfConfirm)];
        // 弹簧
        UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        _toolBar.items = @[cancelItem, flexSpace, confirmItem];
    }
    return _toolBar;
}


- (void)btnClickedOfCancel {
    [self.view endEditing:YES];
}

- (void)btnClickedOfConfirm {
    //  获取选中的日期
    NSDate *selectedDate = self.datePicker.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    NSString *date = [dateFormatter stringFromDate:selectedDate];
    
    // 将日期设置给文本框
    self.textField.text = date;
    
    // 关闭键盘
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置文本框的输入源为datePicker
    self.textField.inputView = self.datePicker;
    // 设置文本输入框的accessory 为 toolBar
    self.textField.inputAccessoryView = self.toolBar;
}


@end
