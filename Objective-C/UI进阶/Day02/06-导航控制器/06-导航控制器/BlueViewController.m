//
//  BlueViewController.m
//  06-导航控制器
//
//  Created by Peyet-Zhao on 2021/9/29.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "BlueViewController.h"

@interface BlueViewController ()

@end

@implementation BlueViewController
- (IBAction)btnClickedJumpToGreen:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)jumpToRed:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/**
 返回到指定的控制器必须是在栈中的控制器
 */
- (IBAction)jumpToSpcifyController:(id)sender {
    // 导航控制器中所有的控制器
    NSArray *viewControllers = self.navigationController.viewControllers;
    
    [self.navigationController popToViewController:viewControllers[1] animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
