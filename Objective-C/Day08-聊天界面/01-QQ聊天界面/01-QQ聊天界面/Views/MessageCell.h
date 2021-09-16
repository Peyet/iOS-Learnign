//
//  MessageCell.h
//  01-QQ聊天界面
//
//  Created by Peyet-Zhao on 2021/9/16.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageFrame.h"

NS_ASSUME_NONNULL_BEGIN

@interface MessageCell : UITableViewCell

@property (nonatomic, strong) MessageFrame *messageFrame;

+ (instancetype)messageViewWithTabelView:(UITableView *)tableViewe;

@end

NS_ASSUME_NONNULL_END
