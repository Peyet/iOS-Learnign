//
//  ViewController.m
//  Day06-06-性能优化版-汽车品牌展示
//
//  Created by Peyet-Zhao on 2021/9/12.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "Group.h"
#import "Car.h"

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, strong) NSArray *groups;

@end

@implementation ViewController

#pragma mark - 懒加载
- (NSArray *)groups {
    if (_groups == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
        NSArray *arrayOfDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayOfModel = [NSMutableArray new];
        for (NSDictionary *dict in arrayOfDict) {
            Group *group = [Group groupWithDict:dict];
            [arrayOfModel addObject:group];
        }
        _groups = arrayOfModel;
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 实现tableViewDataSource协议

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    Group *group = self.groups[section];
    return group.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // create cell
    static NSString *ID = @"car";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // get data
    Group *group = self.groups[indexPath.section];
    Car *car = group.cars[indexPath.row];
    
    // set data to the cell
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}

// 设置组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    Group *group = self.groups[section];
    return group.title;
}

// 去掉状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
}

// 右侧的索引



@end
