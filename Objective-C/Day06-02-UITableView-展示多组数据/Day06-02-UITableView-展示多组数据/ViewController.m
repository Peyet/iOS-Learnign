//
//  ViewController.m
//  Day06-02-UITableView-展示多组数据
//
//  Created by Peyet-Zhao on 2021/9/10.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRow;
    switch (section) {
        case 0:
            numberOfRow = 3-section;
            break;
            case 1:
            numberOfRow = 3-section;
            break;
            case 2:
            numberOfRow = 3-section;
            break;
    }
    return numberOfRow;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

    
    if (indexPath.section == 0) { // 第一组, 亚洲
        
        if (indexPath.row == 0) {
            cell.textLabel.text = @"中国";
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"日本";
        } else {
            cell.textLabel.text = @"韩国";
        }
        
        
    } else if (indexPath.section == 1) { // 第二组, 非洲
        
        
        if (indexPath.row == 0) {
            cell.textLabel.text = @"南非";
        } else {
            cell.textLabel.text = @"索马里";
        }
        
    } else { // 第三组, 欧洲
        cell.textLabel.text = @"荷兰";
    }

    
    return cell;
}


// 每一组的组标题显示什么
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"亚洲";
    } else if ( section == 1) {
        return @"非洲";
    } else {
        return @"欧洲";
    }
}

// 每一组的"组尾"（组描述）
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    // 根据当前组的索引section, 返回不同组的描述信息
    if (section == 0) {
        return @"亚细亚洲, 日出的地方";
    } else if (section == 1) {
        return @"阿里非加州, 阳光灼热的地方";
    } else {
        return @"欧罗巴洲，鲜花盛开的地方，日落的地方。";
    }
}


@end
