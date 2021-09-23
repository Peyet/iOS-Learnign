//
//  PracticController.m
//  01-QQ聊天界面
//
//  Created by Peyet-Zhao on 2021/9/17.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "PracticController.h"
#import "Message.h"
#import "MessageFrame.h"
#import "MessageCell.h"

@interface PracticController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *messages;

@end

@implementation PracticController

- (NSMutableArray *)messages {
    if (_messages == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
        NSArray *arrayOfDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayOfModel = [NSMutableArray new];
        for (NSDictionary *dict in arrayOfDict) {
            Message *model = [Message messageWithDict:dict];
            MessageFrame *modelOfFrame = [MessageFrame new];
            modelOfFrame.message = model;
            
            [arrayOfModel addObject:modelOfFrame];
        }
        _messages = arrayOfModel;
    }
    return _messages;
}

#pragma mark - dataSource protocol
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // get Model
    MessageFrame *model = self.messages[indexPath.row];
    
    // get cell
    MessageCell *cell = [MessageCell messageViewWithTabelView:tableView];
    
    // banding data to cell
    cell.messageFrame = model;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageFrame *model = self.messages[indexPath.row];
    return model.rowHeight;
}


#pragma mark - tableViewDelegate protocol



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
