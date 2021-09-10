//
//  ViewController.m
//  Day-06-04-LOL英雄信息
//
//  Created by Peyet-Zhao on 2021/9/10.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "Hero.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate> 
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *heros;

@end

@implementation ViewController

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2) {
        return 60;
    } else {
        return 100;
    }
}

#pragma mark -
- (NSArray *)heros {
    if (_heros == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
        NSArray *arrayOfDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayOfModel = [NSMutableArray new];
        for (NSDictionary *dict in arrayOfDict) {
            Hero *h = [Hero hero:dict];
            [arrayOfModel addObject:h];
        }
        _heros =arrayOfModel;
    }
    return _heros;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置tableView的行高
    self.tableView.rowHeight = 60;
    
    // 对于每行的行高不同, 需要通过代理实现
    
    
    // 设置分割线的颜色
    self.tableView.separatorColor = [UIColor systemRedColor];
    
    self.tableView.tableHeaderView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    self.tableView.tableFooterView = [UISwitch new];
}

#pragma mark - 实现dataSource协议部分方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.heros.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    Hero *hro = self.heros[indexPath.row];
    
    cell.textLabel.text = hro.name;
    cell.detailTextLabel.text = hro.intro;
    cell.imageView.image = [UIImage imageNamed:hro.icon];
    
    // 在单元格右边显示一个小箭头, 可哟通过设置单元格对象的属性来实现
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // 可以自定义右边单元格的accessory
//    cell.accessoryView = [UISwitch new];
    
    return cell;
}


@end
