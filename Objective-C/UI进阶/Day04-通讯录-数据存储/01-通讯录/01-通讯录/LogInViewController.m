//
//  LogInViewController.m
//  01-通讯录
//
//  Created by Peyet-Zhao on 2021/9/30.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "LogInViewController.h"
#import "MBProgressHUD+Ex.h"
#import "ContactViewController.h"

@interface LogInViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passWordField;
@property (weak, nonatomic) IBOutlet UIButton *logInButton;
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;

@end

@implementation LogInViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.userNameField addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];
    [self.passWordField addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];
    
    [self.logInButton addTarget:self action:@selector(logIn) forControlEvents:UIControlEventTouchUpInside];

    // 监听开关
    [self.leftSwitch addTarget:self action:@selector(rememberPassWord) forControlEvents:UIControlEventValueChanged];
    [self.rightSwitch addTarget:self action:@selector(autoLogIn) forControlEvents:UIControlEventValueChanged];
    
    // 初始化用户界面
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    self.leftSwitch.on = [ud boolForKey:@"remPasswordKey"];
    self.rightSwitch.on = [ud boolForKey:@"autoLogInKey"];
    self.userNameField.text = [ud objectForKey:@"userNameFieldKey"];
    if (self.leftSwitch.on) {
        self.passWordField.text = [ud objectForKey:@"passWordFieldKey"];
    }
    if (self.rightSwitch.on) {
        [self logIn];
    }
    
    [self textChanged];
}

- (void)textChanged {
    NSLog(@"%@", self.userNameField.text);
    self.logInButton.enabled = self.userNameField.text.length > 0 && self.passWordField.text.length > 0;
}

- (void)rememberPassWord {
    if (!self.leftSwitch.on) {
        [self.rightSwitch setOn:NO animated:YES];
    }
}

- (void)autoLogIn {
    if (self.rightSwitch.isOn) {
        [self.leftSwitch setOn:YES animated:YES];
    }
}



- (void)logIn {
    // 显示提示 正在登录
    [MBProgressHUD showMessage:@"正在登录"];
    
    // 延时3秒钟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 隐藏提示
        [MBProgressHUD hideHUD];
        if ([self.userNameField.text isEqualToString:@"1"] && [self.passWordField.text isEqualToString:@"1"]) {
            
            [self performSegueWithIdentifier:@"logInToContact" sender:self];
            [MBProgressHUD showSuccess:@"登陆成功"];
            
            NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
            [ud setBool:self.rightSwitch.on forKey:@"autoLogInKey"];
            [ud setBool:self.leftSwitch.on forKey:@"remPasswordKey"];
            [ud setObject:self.userNameField.text forKey:@"userNameFieldKey"];
            [ud setObject:self.passWordField.text forKey:@"passWordFieldKey"];
            [ud synchronize];
        } else {
            // 提示错误
            [MBProgressHUD showError:@"用户名或密码错误"];
        }
    
    });
    
}

// 只要使用segue跳转, 都会调用这个方法
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ContactViewController *contact = segue.destinationViewController;
    contact.userName = self.userNameField.text;
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
