//
//  EditingViewController.m
//  01-通讯录
//
//  Created by Peyet-Zhao on 2021/10/1.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "EditingViewController.h"

@interface EditingViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoenNumberField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation EditingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nameField.text = self.contact.name;
    self.phoenNumberField.text = self.contact.phoneNumber;
    
    [self.saveBtn addTarget:self action:@selector(btnOfSaveClicked) forControlEvents:UIControlEventTouchUpInside];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)editClicked:(UIBarButtonItem *)sender {
    if (self.saveBtn.hidden) {
        sender.title = @"取消";
        self.nameField.enabled =YES;
        self.phoenNumberField.enabled =YES;
        self.saveBtn.hidden = NO;
    } else {
        sender.title = @"编辑";
        self.nameField.enabled =NO;
        self.phoenNumberField.enabled =NO;
        self.saveBtn.hidden = YES;
        
        // 恢复原样
        self.nameField.text = self.contact.name;
        self.phoenNumberField.text = self.contact.phoneNumber;
    }
}

- (void)btnOfSaveClicked {

    if ([self.delegate respondsToSelector:@selector(editingViewControllerDelegate:)]) {
        self.contact.name = self.nameField.text;
        self.contact.phoneNumber = self.phoenNumberField.text;
        [self.delegate editingViewControllerDelegate:self];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
