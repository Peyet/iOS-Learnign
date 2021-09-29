//
//  GreenViewController.m
//  07-通过storyboard使用导航控制器
//
//  Created by Peyet-Zhao on 2021/9/29.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "GreenViewController.h"
#import "BlueViewController.h"

@interface GreenViewController ()

@end

@implementation GreenViewController

- (IBAction)backToRed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
