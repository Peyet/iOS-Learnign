//
//  ViewController.m
//  05-异步下载网络图片
//
//  Created by Peyet-Zhao on 2021/10/20.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "AppInfo.h"
#import "AppInfoCell.h"

@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) NSArray *appInfos;
@end

@implementation ViewController

- (NSArray *)appInfos {
    return [AppInfo appInfos];;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@", self.appInfos);
}

#pragma mark - tableView数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.appInfos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // cell
    AppInfoCell* cell = [AppInfoCell appInfoCellWith:tableView];
    
    // model
    AppInfo* model = self.appInfos[indexPath.row];
    
    // input model to cell
    [cell model:model];
//    cell.imageBlock = ^(UIImage * _Nonnull image) {
//        NSLog(@"block");
//        model.image = image;
//        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
//    };
    
    return cell;
}

@end
