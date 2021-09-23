//
//  ViewController.m
//  05QQ聊天
//
//  Created by Peyet-Zhao on 2021/9/19.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "Message.h"
#import "MessageFrame.h"
#import "MessageCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *messageFrames;
@property (weak, nonatomic) IBOutlet UITextField *textFieldInput;


@end

@implementation ViewController

- (NSMutableArray *)messageFrames {
    if (_messageFrames == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
        NSArray *arrayOfDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayOfModel = [NSMutableArray new];
        for (NSDictionary *dict in arrayOfDict) {
            Message *model = [Message messageWithDict:dict];
            MessageFrame *lastOfModel = [arrayOfModel lastObject];
            if ([model.time isEqualToString:lastOfModel.message.time]) {
                model.hideTime = YES;
            } else {
                model.hideTime = NO;
            }
            MessageFrame *modelFrame = [MessageFrame new];
            modelFrame.message = model;
            [arrayOfModel addObject:modelFrame];
        }
        _messageFrames = arrayOfModel;
    }
    return _messageFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.tableView.rowHeight = 100;
    self.tableView.backgroundColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0];
    
    // 取消被选中
    self.tableView.allowsSelection = NO;
    // 取消单元格分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    #pragma mark - 监听键盘弹出事件
    NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
    [notification addObserver:self selector:@selector(observerWithNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    // 键盘回弹
//    UITableView delegate 方法
    
    
}

/**
 键盘监听函数
 */
- (void)observerWithNotification:(NSNotification *)notification {
    NSLog(@"keyboard was apeared");
    NSLog(@"%@", notification);
    NSLog(@"-------------------------------------");
    CGRect keyBoardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, keyBoardRect.origin.y - 896);
        NSIndexPath *idxPath = [NSIndexPath indexPathForRow:self.messageFrames.count -1 inSection:0];
        [self.tableView scrollToRowAtIndexPath:idxPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MessageFrame *messageFrame = self.messageFrames[indexPath.row];

    MessageCell *cell = [MessageCell MessageCellWithTableView:tableView];
    
    cell.messageFrame = messageFrame;
    
    return cell;
}

// rowHeight
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageFrame *messageFrame = self.messageFrames[indexPath.row];
    return messageFrame.rowHeight;
}


#pragma mark - UITableViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"scroll View beeeeeeegin drag.......");
    [self.view endEditing:YES];
}


#pragma mark - UITextFieldDelegate

// send button in the keyboard was pressed
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"send");
    [self addNewModelWithText:nil];
    [self addNewModelWithText:@"what would you say???"];
    
    self.textFieldInput.text = nil;
    
    return YES;
}

// 创建新模型, 并刷新tableView
- (void)addNewModelWithText:(NSString *)text {
    
    // text
    NSString *strUserInput = text == nil ? self.textFieldInput.text : text;
    Message *model = [Message new];
    model.text = strUserInput;
    
    // time
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"今天 HH:mm";
    NSString *date = [formatter stringFromDate:nowDate];
    model.time = date;
    
    // type
    model.type = text == nil ? MessageTypeMe : MessageTypeOther;
    
    // hideTime
    MessageFrame *lastOfModel = [self.messageFrames lastObject];
    if ([lastOfModel.message.time isEqualToString:model.time]) {
        model.hideTime = YES;
    } else {
        model.hideTime = NO;
    }
    
    // add model to the array
    MessageFrame *messageFrame = [[MessageFrame alloc] init];
    messageFrame.message = model;
    [self.messageFrames addObject:messageFrame];
    
    // reload tableView to flash data
    [self.tableView reloadData];
    NSIndexPath *idxPath = [NSIndexPath indexPathForRow:self.messageFrames.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:idxPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}


@end
