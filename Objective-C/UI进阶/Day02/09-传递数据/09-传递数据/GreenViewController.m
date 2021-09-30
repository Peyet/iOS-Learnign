//
//  GreenViewController.m
//  09-传递数据
//
//  Created by Peyet-Zhao on 2021/9/30.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "GreenViewController.h"

@interface GreenViewController ()

@end

@implementation GreenViewController


- (IBAction)backToRed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
