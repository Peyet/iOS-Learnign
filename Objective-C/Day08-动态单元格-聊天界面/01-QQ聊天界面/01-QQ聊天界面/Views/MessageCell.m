//
//  MessageCell.m
//  01-QQ聊天界面
//
//  Created by Peyet-Zhao on 2021/9/16.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "MessageCell.h"
#import "Message.h"

@interface MessageCell ()

@property (nonatomic, weak) UILabel *lblTime;
@property (nonatomic, weak) UIImageView *imgViewIcon;
@property (nonatomic, weak) UIButton *btnText;

@end

@implementation MessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *lblTime = [UILabel new];
        [self.contentView addSubview:lblTime];
        self.lblTime = lblTime;
        
        UIButton *btnMessage = [UIButton new];
        [self.contentView addSubview:btnMessage];
        self.btnText = btnMessage;
        
        UIImageView *imgIcon = [UIImageView new];
        [self.contentView addSubview:imgIcon];
        self.imgViewIcon = imgIcon;
    }
    return self;
}

- (void)setMessageFrame:(MessageFrame *)messageFrame {
    _messageFrame = messageFrame;
    Message *message = messageFrame.message;
    
    self.lblTime.text = message.time;
    self.lblTime.frame = messageFrame.timeFrame;
    
    if (message) {
        self.imgViewIcon.image =  [UIImage imageNamed:@"other"];
    } else {
        self.imgViewIcon.image =  [UIImage imageNamed:@"me"];
    }
    self.imgViewIcon.frame = messageFrame.iconFrame;
    
    [self.btnText setTitle:message.text forState:UIControlStateNormal];
    self.btnText.frame = messageFrame.textFrame;
}

+ (instancetype)messageViewWithTabelView:(UITableView *)tableView {
    static NSString *ID = @"message_cell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
