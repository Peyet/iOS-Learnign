//
//  ViewController.m
//  06-关联对象
//
//  Created by Peyet-Zhao on 2021/10/22.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+MyImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView* image = [UIImageView new];
    image.urlString = @"aaaaa";
    NSLog(@"urlString : %@", image.urlString);
}


@end
