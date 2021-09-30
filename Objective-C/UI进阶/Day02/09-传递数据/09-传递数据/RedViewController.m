//
//  RedViewController.m
//  09-传递数据
//
//  Created by Peyet-Zhao on 2021/9/30.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "RedViewController.h"
#import "GreenViewController.h"

@interface RedViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation RedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Navigation
//    UIStoryboardSegue
//    @property (nullable, nonatomic, copy, readonly) NSString *identifier;                     标记
//    @property (nonatomic, readonly) __kindof UIViewController *sourceViewController;          源控制器
//    @property (nonatomic, readonly) __kindof UIViewController *destinationViewController;     目标控制器

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSString *message = self.textField.text;
    
    // 获取目标控制器
    GreenViewController *greenViewcontroller = segue.destinationViewController;
    greenViewcontroller.navigationItem.title = message;
    
}

@end
