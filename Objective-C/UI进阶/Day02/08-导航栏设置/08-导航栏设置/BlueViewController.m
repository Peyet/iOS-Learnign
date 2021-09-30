//
//  BlueViewController.m
//  08-导航栏设置
//
//  Created by Peyet-Zhao on 2021/9/29.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "BlueViewController.h"

@interface BlueViewController ()

@end

@implementation BlueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)btnBackToGreen:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnBackToUperController:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (IBAction)btnBackToSpecifyController:(id)sender {
    NSArray *controllers = self.navigationController.viewControllers;
    [self.navigationController popToViewController:controllers[1] animated:YES];
}

@end
