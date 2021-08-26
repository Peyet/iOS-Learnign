//
//  ViewController.m
//  Day01-LoginUI
//
//  Created by Peyet-Zhao on 2021/8/26.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)Login;
@property (weak, nonatomic) IBOutlet UITextField *Email;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _Email.clearButtonMode = YES;
    _password.clearButtonMode = YES;
}


- (IBAction)Login {
    NSLog(@"email:%@, password: %@", _Email.text, _password.text);
    [self.view endEditing:YES];
}
@end
