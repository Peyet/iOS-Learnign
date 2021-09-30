//
//  GreenViewController.m
//  08-导航栏设置
//
//  Created by Peyet-Zhao on 2021/9/29.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "GreenViewController.h"

@interface GreenViewController ()

@end

@implementation GreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 左侧放置一个按钮 (会替换上一个view的 返回按钮 或0者 title)
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(btnClicked1)];
    self.navigationItem.leftBarButtonItem = left;

}
- (IBAction)btnBackToRed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
