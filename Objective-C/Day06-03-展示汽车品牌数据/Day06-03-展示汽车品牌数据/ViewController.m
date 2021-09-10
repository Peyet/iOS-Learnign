//
//  ViewController.m
//  Day06-03-展示汽车品牌数据
//
//  Created by Peyet-Zhao on 2021/9/10.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "Group.h"

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, strong) NSArray *groups;
@end

@implementation ViewController

#pragma mark - 懒加载数据
// 懒加载groups
- (NSArray *)groups {
    if (_groups == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_simple.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrOfGroup = [NSMutableArray new];
        for (NSDictionary *dict in arr) {
            Group *group = [Group groupWithDict:dict];
            [arrOfGroup addObject:group];
        }
        _groups = arrOfGroup;
        
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 数据源方法方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    Group *group = self.groups[section];
    return group.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获取模型数据
    Group *section = self.groups[indexPath.section];
    NSString *brand = section.cars[indexPath.row];
    
    // 创建view
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    // 将数据设置给View
    cell.textLabel.text = brand;
    
    return cell;
}

// 设置组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    Group *group = self.groups[section];
    return group.title;
}

// 设置描述
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    Group *group = self.groups[section];
    return group.desc;
}

@end
