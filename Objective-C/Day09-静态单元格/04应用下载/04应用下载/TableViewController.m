//
//  TableViewController.m
//  04应用下载
//
//  Created by Peyet-Zhao on 2021/9/23.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "TableViewController.h"
#import "App.h"
#import "AppCell.h"

@interface TableViewController () <UITableViewDataSource, AppCellDelegate>

@property (nonatomic, strong) NSArray *apps;

@end

@implementation TableViewController

- (NSArray *)apps {
    if (_apps == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"apps_full.plist"
                                        ofType:nil];
        NSArray *arrayOfDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayOfModel = [NSMutableArray new];
        for (NSDictionary *dict in arrayOfDict) {
            App *model = [App appWithDict:dict];
            [arrayOfModel addObject:model];
        }
        _apps = arrayOfModel;
    }
    return _apps;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 70;
    
    NSLog(@"%p, %p", self.view, self.tableView);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark - AppCell

- (void)appCellDidDownloadButton:(AppCell *)appCell {
    UILabel *alert = [UILabel new];
    
    alert.text = @"正在下载...";
    alert.frame = CGRectMake(150, 400, 114, 35);
    alert.alpha = 0;
    alert.backgroundColor = [UIColor redColor];
    alert.textColor = [UIColor blackColor];
    alert.textAlignment = NSTextAlignmentCenter;
    alert.layer.cornerRadius = 5;
    alert.layer.masksToBounds = YES;
    
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionAutoreverse animations:^{
        alert.alpha = 0.6;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            alert.alpha = 0;
            [alert removeFromSuperview];
            appCell.btnDownload.enabled = NO;
        }];
    }];

    [self.tableView addSubview:alert];
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.apps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AppCell *cell = [AppCell appWithTableView:tableView];
    cell.delegate = self;
    
    App *model = self.apps[indexPath.row];
    
    cell.app = model;
    
    return cell;
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
