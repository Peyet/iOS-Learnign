//
//  MYTableViewController.m
//  04-微博案例
//
//  Created by Peyet-Zhao on 2021/9/14.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "MYTableViewController.h"
#import "Weibo.h"

@interface MYTableViewController ()

@property (nonatomic, strong) NSArray *weibos;


@end

@implementation MYTableViewController

#pragma mark - 懒加载数据

- (NSArray *)weibos {
    if (_weibos == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"weibos.plist" ofType:nil];
        NSArray *arrayOfDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayOfModel = [NSMutableArray new];
        for (NSDictionary *dict in arrayOfDict) {
            Weibo *model = [Weibo weiboWithDict:dict];
            [arrayOfModel addObject:model];
        }
        _weibos = arrayOfModel;
    }
    return _weibos;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    NSLog(@"--------numberOfSectionsInTableView-----------");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    NSLog(@"----numberOfRows----------:%ld", _weibos.count);
    return self.weibos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"------cellForRow-------------");
    
    Weibo *model = self.weibos[indexPath.row];
    
    static NSString *ID = @"weibo_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.imageView.image = [UIImage imageNamed:model.icon];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.text;
    
    return cell;
}


@end
