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
    // 创建单元格
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    // 每次都创建单元格效率低下, 下面对单元格重用
    // 在创建单元的时候指定一个“重用ID”
    // 当需要新单元格时, 先去“缓冲池”中查找是否有与自己样式相同的单元格(即“重用ID”相同)
    // 如果有拿出来修改,进行使用. 没有则新创建一个
    
    // 声明一个重用ID
    static NSString *ID = @"hero_cell";
    // 根据这个重用ID去“缓冲池”中查找对应的Cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        NSLog(@"===================");
        // 创建新的单元格
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    
    
    
    // 获取模型数据
    Hero *hro = self.heros[indexPath.row];
    
    
    //设置数据
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
