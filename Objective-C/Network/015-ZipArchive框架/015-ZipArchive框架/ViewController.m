//
//  ViewController.m
//  015-ZipArchive框架
//
//  Created by Peyet-Zhao on 2021/11/19.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "ZipArchive.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [SSZipArchive unzipFileAtPath:<#(nonnull NSString *)#> toDestination:<#(nonnull NSString *)#>];
}


@end
