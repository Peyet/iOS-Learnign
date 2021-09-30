//
//  ContactViewController.m
//  01-通讯录
//
//  Created by Peyet-Zhao on 2021/9/30.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 注销
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:@selector(logOut)];
    
    NSString *title = [NSString stringWithFormat:@"%@的联系人", self.userName];
    self.navigationItem.title = title;
}

- (void)logOut {
//    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Title" delegate:nil cancelButtonTitle:@"cancelButtonTitle" destructiveButtonTitle:@"destructiveButtonTitle" otherButtonTitles:@"11", @"22", nil];
//    [sheet showInView:self.view];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"是否要注销?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *actionOfLogOut = [UIAlertAction actionWithTitle:@"注销" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"注销");
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    UIAlertAction *actionOfCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    
    [alertController addAction:actionOfLogOut];
    [alertController addAction:actionOfCancel];

    [self presentViewController:alertController animated:YES completion:^{
        
    }];
}

@end
