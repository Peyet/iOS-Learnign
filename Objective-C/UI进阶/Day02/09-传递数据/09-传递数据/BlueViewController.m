//
//  BlueViewController.m
//  09-传递数据
//
//  Created by Peyet-Zhao on 2021/9/30.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "BlueViewController.h"

@interface BlueViewController ()

@end

@implementation BlueViewController
- (IBAction)backToGreen:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)backToRootViewController:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)backToSpecifyViewCOntroller:(id)sender {
    NSArray *viewControllers = self.navigationController.viewControllers;
    [self.navigationController popToViewController:viewControllers[1] animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
