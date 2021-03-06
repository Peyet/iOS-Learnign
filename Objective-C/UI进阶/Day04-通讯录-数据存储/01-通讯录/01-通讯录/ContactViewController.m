//
//  ContactViewController.m
//  01-通讯录
//
//  Created by Peyet-Zhao on 2021/9/30.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ContactViewController.h"
#import "AddContactViewController.h"
#import "Contact.h"
#import "EditingViewController.h"


@interface ContactViewController () <AddContactViewControllerDelegate, UITableViewDataSource, EditingViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *contacts;

@end

@implementation ContactViewController

- (NSMutableArray *)contacts {
    if (_contacts == nil) {
        _contacts = [NSMutableArray new];
    }
    return _contacts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 注销
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:@selector(logOut)];
    
    NSString *title = [NSString stringWithFormat:@"%@的联系人", self.userName];
    self.navigationItem.title = title;
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    // 加载Documents中联系人数据
    NSData *contactsData = [NSData dataWithContentsOfFile:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"contacts.data"]];
    NSError *unarchiveError;
    NSSet *set = [[NSSet alloc] initWithObjects:Contact.class, NSMutableArray.class, nil];
    _contacts = [NSKeyedUnarchiver unarchivedObjectOfClasses:set fromData:contactsData error:&unarchiveError];
    
    NSLog(@"unarchive ERROR : %@", unarchiveError);
}

- (void)logOut {
//    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Title" delegate:nil cancelButtonTitle:@"cancelButtonTitle" destructiveButtonTitle:@"destructiveButtonTitle" otherButtonTitles:@"11", @"22", nil];
//    [sheet showInView:self.view];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"是否要注销?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *actionOfLogOut = [UIAlertAction actionWithTitle:@"注销" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"注销");
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    UIAlertAction *actionOfCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    
    [alertController addAction:actionOfLogOut];
    [alertController addAction:actionOfCancel];

    [self presentViewController:alertController animated:YES completion:^{
        NSLog(@"Button clicked.");
    }];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    UIViewController *vc = segue.destinationViewController;
    if ([vc isKindOfClass:[AddContactViewController class]]) {
        AddContactViewController *add = (AddContactViewController *)vc;
        add.delegate = self;
    } else {
        EditingViewController *edit = (EditingViewController *)vc;
        edit.delegate = self;
        
        NSIndexPath *idxPath = [self.tableView indexPathForSelectedRow];
        
        edit.contact = self.contacts[idxPath.row];
    }
    
}

// 添加联系人的代理方法
- (void)addContactViewController:(AddContactViewController *)addViewController withContact:(nonnull Contact *)contact {
    NSLog(@"%@-----%@", contact.name, contact.phoneNumber);
    [self.contacts addObject:contact];
    
    [self.tableView reloadData];
    
    
    // 保存数据到Documents
    NSError *archiveError;
    NSData *contactData = [NSKeyedArchiver archivedDataWithRootObject:self.contacts requiringSecureCoding:YES error:&archiveError];
    NSLog(@"archiveError : %@", archiveError);
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"contacts.data"];
    [contactData writeToFile:filePath atomically:YES];
}

#pragma mark - TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"contact_cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    cell.textLabel.text = [self.contacts[indexPath.row] name];
    cell.detailTextLabel.text = [self.contacts[indexPath.row] phoneNumber];
    
    return cell;
}


// editingViewController 代理
- (void)editingViewControllerDelegate:(EditingViewController *)editinngViewController {
    // 保存数据到Documents
    NSError *archiveError;
    NSData *contactData = [NSKeyedArchiver archivedDataWithRootObject:self.contacts requiringSecureCoding:YES error:&archiveError];
    NSLog(@"archiveError : %@", archiveError);
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"contacts.data"];
    [contactData writeToFile:filePath atomically:YES];

    [self.tableView reloadData];
}

// 另一种方法
//- (void)viewWillAppear:(BOOL)animated {
//    [self.tableView reloadData];
//    return YES;
//}

#pragma mark - TableViewDelegate 滑动删除(让tableView进入编辑模式)

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self.contacts removeObject:self.contacts[indexPath.row]];
//    [self.tableView reloadData];
    [self.contacts removeObjectAtIndex:indexPath.row];
    
    // tableVIew 删除某一行
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}


@end
