//
//  RedViewController.m
//  06-导航控制器
//
//  Created by Peyet-Zhao on 2021/9/29.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "RedViewController.h"
#import "GreenViewController.h"

@interface RedViewController ()

@end

@implementation RedViewController
- (IBAction)btnClickedJumpToGreen:(UIButton *)sender {
    GreenViewController *greenVC = [GreenViewController new];
    
//    self.navigationController 获取当前控制器的导航控制器
    [self.navigationController pushViewController:greenVC animated:YES];
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
