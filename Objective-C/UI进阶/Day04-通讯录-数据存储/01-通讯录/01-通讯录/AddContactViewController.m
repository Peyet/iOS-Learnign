//
//  AddContactViewController.m
//  01-通讯录
//
//  Created by Peyet-Zhao on 2021/10/1.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "AddContactViewController.h"

@interface AddContactViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation AddContactViewController
- (IBAction)btnClicked:(id)sender {
    if ([self.delegate respondsToSelector:@selector(addContactViewController:withContact:)]) {
        Contact *contact = [Contact new];
        contact.name = self.name.text;
        contact.phoneNumber = self.phoneNumber.text;
        [self.delegate addContactViewController:self withContact:contact];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.addBtn.enabled = NO;
    
    [self.name addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];
    [self.phoneNumber addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];
    
    // 让姓名文本框成为第一响应者
    [self.name becomeFirstResponder];
    
}

- (void)textChanged {
    NSLog(@"textChanged");
    self.addBtn.enabled = self.name.text.length >0 && self.phoneNumber.text.length > 0;
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
