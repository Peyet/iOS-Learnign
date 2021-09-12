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
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row % 2) {
//        return 60;
//    } else {
//        return 100;
//    }
//}

#pragma mark - 刷新数据 !!!!!!!!!
// 监听行被选中的方法

/*
 
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
 NSLog(@"selected a row at %ld.", indexPath.row);
 
 Hero *hero =  self.heros[indexPath.row];
 NSString *message = hero.name;
 UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"编辑英雄" message:nil preferredStyle:UIAlertControllerStyleAlert];
 [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
 textField.text = message;
 }];
 UIAlertAction *act = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
 NSLog(@"action...");
 // 获取用户修改后的内容
 NSString *alertedMessage = [alert.textFields firstObject].text;
 // 修改模型数据
 Hero *hero = self.heros[indexPath.row];
 hero.name = alertedMessage;
 // 刷新tableView
 //        [self.tableView reloadData]; // 刷新整个tableView
 
 // 局部刷新 之刷新修改的数据
 NSIndexPath *indxPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
 [self.tableView reloadRowsAtIndexPaths:@[indxPath] withRowAnimation:UITableViewRowAnimationAutomatic];
 
 
 }];
 UIAlertAction *actCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
 [alert addAction:act];
 [alert addAction:actCancel];
 
 [self presentViewController:alert animated:YES completion:nil];
 
 }
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // get selected data
    NSString *heroInfo;
    NSIndexPath *idxPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
//    heroInfo = [tableView cellForRowAtIndexPath:idxPath].textLabel.text;
    Hero *hero = self.heros[indexPath.row];
    heroInfo = hero.name;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@" 修改英雄" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actOk = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *alertedInfo = [alertController.textFields firstObject].text;
        Hero *hero = self.heros[indexPath.row];
        hero.name = alertedInfo;
        [tableView reloadRowsAtIndexPaths:@[idxPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }];
    UIAlertAction *actCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:actOk];
    [alertController addAction:actCancel];
    
    // add textField
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = heroInfo;
    }];
    
    [self presentViewController:alertController animated:YES completion:nil];
        
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
