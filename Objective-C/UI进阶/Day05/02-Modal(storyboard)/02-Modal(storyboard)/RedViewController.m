//
//  RedViewController.m
//  02-Modal(storyboard)
//
//  Created by Peyet-Zhao on 2021/10/4.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "RedViewController.h"

@interface RedViewController ()

@end

@implementation RedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.redColor;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
