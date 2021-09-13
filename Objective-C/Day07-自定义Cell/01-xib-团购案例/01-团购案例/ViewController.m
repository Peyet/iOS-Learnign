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

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *goods;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

#pragma mark - 懒加载数据
- (NSArray *)goods {
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
    
    // 设置cell 的高度
    [self.tableView setRowHeight:60];
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
