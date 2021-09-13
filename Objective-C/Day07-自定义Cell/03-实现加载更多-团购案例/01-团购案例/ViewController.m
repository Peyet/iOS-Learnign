//
//  ViewController.m
//  01-团购案例
//
//  Created by Peyet-Zhao on 2021/9/13.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "Goods.h"
#import "GoodsCell.h"
#import "FooterView.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, FooterViewDelegate>
@property (nonatomic, strong) NSMutableArray *goods;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

#pragma mark - 懒加载数据
- (NSMutableArray *)goods {
    if (_goods == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        NSArray *arrayOfDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayOfModel = [NSMutableArray new];
        for (NSDictionary *dict in arrayOfDict) {
            Goods *goods = [Goods goodsWithDict:dict];
            [arrayOfModel addObject:goods];
        }
        _goods = arrayOfModel;
    }
    return _goods;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"-------------");
    /*
     // 设置cell 的高度
     [self.tableView setRowHeight:60];
     // 设置UITableView的footerView
     self.tableView.tableFooterView = [UIButton buttonWithType:UIButtonTypeContactAdd];
     // 无法通过修改button的frame 来控制button 在cell中的位置
     */
    
    // 通过xib设置UITableView的footerView
    FooterView *footerView = [FooterView footerView];
    
    // 设置footerView的代理
    footerView.delegate = self;
    self.tableView.tableFooterView = footerView;
}

#pragma mark - 实现footerView的方法
- (void)footerViewUpdateData:(FooterView *)footerView {
    // 增加一条数据
    // ..1创建一个模型对象
    Goods *model = [Goods new];
    model.title = @"title";
    model.price = @"11";
    model.buyCount = @"11111";
    model.icon = @"53453be0d2dd458c057286d17f6b9306";
    // ..2把模型对象驾到控制器的goods集合中
    [self.goods addObject:model];
    
    // 刷新tableView
    [self.tableView reloadData];
    
    // 把tableView中的最后一行数据滚动到屏幕上
    NSIndexPath *idxPath = [NSIndexPath indexPathForRow:self.goods.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:idxPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
}

#pragma mark - tableViewDataSource 协议
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.goods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    // 创建单元格
    /*
     ------------------------封装-------------------
     static NSString *ID = @"Goods_Cell";
     GoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
     if (cell == nil) {
         // 通过xib的方式创建单元格
         cell = [[[NSBundle mainBundle] loadNibNamed:@"GoodsCell" owner:nil options:nil] firstObject];
     }
     */
    GoodsCell *cell = [GoodsCell goodsCellWithTableView:tableView];
    
    
    // get data
    Goods *model = self.goods[indexPath.row];
    
    // set data
    cell.goods = model;
    
/*
 // create cell
 {
 //    static NSString *ID = @"goods_cell";
 //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
 //    if (cell == nil) {
 //        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
 //    }
 }
 
 // get data
 Goods *goods = self.goods[indexPath.row];
 
 // set data
 cell.textLabel.text = goods.title;
 cell.imageView.image = [UIImage imageNamed:goods.icon];
 cell.detailTextLabel.text = [NSString stringWithFormat:@"¥ %@  \t\t\t\t\t%@人已购买", goods.price, goods.buyCount];

 */
    return cell;
}

#pragma mark - tableViewDelegate 协议

#pragma mark - others
- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
