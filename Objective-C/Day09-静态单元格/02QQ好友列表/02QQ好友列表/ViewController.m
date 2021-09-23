//
//  ViewController.m
//  02QQ好友列表
//
//  Created by Peyet-Zhao on 2021/9/20.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "Friend.h"
#import "Group.h"
#import "FriendFrame.h"
#import "FriendCell.h"

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, strong) NSArray *groups;


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (NSArray *)groups {
    if (_groups == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
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


#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    Group *group = self.groups[section];
    NSLog(@"section:%ld, row:%lu", (long)section, (unsigned long)group.friends.count);
    return group.friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // get data
    // ---------------------重要----------------------
    //---------先建模型, 根据Model建----------------
//    NSArray *sectionOfData = self.groups[indexPath.section];
//    FriendFrame *friendFrame = sectionOfData[indexPath.row];
    Group *group = self.groups[indexPath.section];
    FriendFrame *friendFrame = group.friends[indexPath.row];
    
    // create cell
    FriendCell *cell = [FriendCell friendWithTableView:tableView];
    
    // bounding data
    cell.friendFrame = friendFrame;
    
    return cell;
}

@end
