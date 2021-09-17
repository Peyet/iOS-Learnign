//
//  ViewController.m
//  01-QQ聊天界面
//
//  Created by Peyet-Zhao on 2021/9/16.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "Message.h"
#import "MessageFrame.h"
#import "messageCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *messageFrames;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (NSMutableArray *)messageFrames {
    if (_messageFrames == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
        NSArray *arrayOfDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayOfModel = [NSMutableArray new];
        for (NSDictionary *dict in arrayOfDict) {
            Message *model = [Message messageWithDict:dict];
            MessageFrame *modelFrame = [MessageFrame new];
            
            MessageFrame *preMessage = [arrayOfModel lastObject];
            if ([model.time isEqualToString:preMessage.message.time]) {
                model.hideTime = YES;
            } else {
                model.hideTime = NO;
            }
            
            modelFrame.message = model;
            
            // 判断当前消息发送时间是否和上一条消息发送时间是否一致

            [arrayOfModel addObject:modelFrame];
            
        }
        _messageFrames = arrayOfModel;
    }
    return _messageFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 取消掉tableView的分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 设置背景色
    self.tableView.backgroundColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0];
    
    // 设置cell 不允许被选中
    self.tableView.allowsSelection = NO;
    
}

#pragma mark - 设置数据源

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MessageFrame *messageFrame = self.messageFrames[indexPath.row];
    
    MessageCell *cell = [MessageCell messageViewWithTabelView:tableView];
    
    cell.messageFrame = messageFrame;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageFrame *messageFrame = self.messageFrames[indexPath.row];
    return messageFrame.rowHeight;
}


@end
