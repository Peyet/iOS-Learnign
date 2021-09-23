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

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray *messageFrames;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textInput;


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
    
    // 为输入框添加一个UIView
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 1)];
    self.textInput.leftView = leftView;
    self.textInput.leftViewMode = UITextFieldViewModeAlways;
    
    // 监听键盘的弹出事件
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(keyboardWillChangeFrame:) name:@"UIKeyboardWillChangeFrameNotification" object:nil];
    NSLog(@"notification start.");
    
}

/**
 监听键盘弹出事件
 */
- (void)keyboardWillChangeFrame:(NSNotification *)notification {
    NSLog(@" 通知名称: %@ \n 通知发送者: %@ \n 通知内容 : %@", notification.name, notification.object, notification.userInfo);
    CGRect keyBoardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    [UIView animateWithDuration:0.25 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, keyBoardRect.origin.y - 896);
    }];

    
    // 使消息弹到最顶端
    NSIndexPath *idxPath = [NSIndexPath indexPathForRow:self.messageFrames.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:idxPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)dealloc
{
    // 移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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


#pragma mark - tableView的delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    // 召回键盘
    [self.view endEditing:YES];
}

#pragma  mark - textField Delegate implementation
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //  发送键被点击
    // 获取输入的内容
    NSString *userInput = textField.text;
    
    // 用户发送的消息
    [self sendMessage:userInput withType:MessageTypeMe];
    
    // 系统回复的消息
    [self sendMessage:@"你说的啥, 听不懂" withType:MessageTypeOther];
    
    // 清空输入的内容
    textField.text = nil;
    
    // 隐藏键盘
//    [self.view endEditing:YES];
    return YES;
}

- (void)sendMessage:(NSString *)text withType:(MessageType)type {
    // 新建数据模型
    Message *messageModel = [Message new];
    messageModel.text = text;
    messageModel.type = type;
    // 获取时间
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"今天 HH:mm";
    messageModel.time = [formatter stringFromDate:nowDate];
    // hideTIme
    MessageFrame *lastModel = [self.messageFrames lastObject];
    if ([lastModel.message.time isEqualToString:messageModel.time]) {
        messageModel.hideTime = YES;
    } else {
        messageModel.hideTime = NO;
    }
    
    
    
    MessageFrame *messageFrameModel = [MessageFrame new];
    messageFrameModel.message = messageModel;
    
    
    
    // 加入到数据模型中
    [self.messageFrames addObject:messageFrameModel];
    
    // 刷新数据模型
    [self.tableView reloadData];
    
    // 消息滚动到最顶端
    NSIndexPath *idxPath = [NSIndexPath indexPathForRow:self.messageFrames.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:idxPath atScrollPosition:UITableViewScrollPositionTop animated:YES];

}

@end
