//
//  MessageCell.h
//  05QQ聊天
//
//  Created by Peyet-Zhao on 2021/9/19.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"
#import "MessageFrame.h"

NS_ASSUME_NONNULL_BEGIN

@interface MessageCell : UITableViewCell

@property (nonatomic, strong) MessageFrame *messageFrame;



+ (instancetype)MessageCellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
