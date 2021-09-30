//
//  LogInViewController.m
//  01-通讯录
//
//  Created by Peyet-Zhao on 2021/9/30.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "LogInViewController.h"
#import "MBProgressHUD+Ex.h"

@interface LogInViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passWordField;
@property (weak, nonatomic) IBOutlet UIButton *logInButton;

@end

@implementation LogInViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.userNameField addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];
    [self.passWordField addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];
    
    [self.logInButton addTarget:self action:@selector(logIn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)textChanged {
    NSLog(@"%@", self.userNameField.text);
    self.logInButton.enabled = self.userNameField.text.length > 0 && self.passWordField.text.length > 0;
}

- (void)logIn {
    // 显示提示 正在登录
    [MBProgressHUD showMessage:@"正在登录"];
    
    // 延时3秒钟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 隐藏提示
        [MBProgressHUD hideHUD];
        if ([self.userNameField.text isEqualToString:@"1"] && [self.passWordField.text isEqualToString:@"1"]) {
            
            [self performSegueWithIdentifier:@"logInToContact" sender:self];
            [MBProgressHUD showSuccess:@"登陆成功"];
        } else {
            // 提示错误
            [MBProgressHUD showError:@"用户名或密码错误"];
        }
    
    });
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
