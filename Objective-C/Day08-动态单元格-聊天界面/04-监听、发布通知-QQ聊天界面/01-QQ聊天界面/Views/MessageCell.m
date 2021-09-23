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
        self.lblTime = lblTime;
        // 设置文字大小
//        self.lblTime.font = [UIFont systemFontOfSize:1];
        [self.contentView addSubview:lblTime];
        self.lblTime.textAlignment = NSTextAlignmentCenter;

        UIButton *btnMessage = [UIButton new];
        [self.contentView addSubview:btnMessage];
        self.btnText = btnMessage;
        // 设置消息文字颜色
//        [self.btnText setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.btnText.titleLabel.font = textFont;
        // 正文内容可以换行
        self.btnText.titleLabel.numberOfLines = 0;
        
        UIImageView *imgIcon = [UIImageView new];
        [self.contentView addSubview:imgIcon];
        self.imgViewIcon = imgIcon;
    }
    // 设置单元格的背景颜色为clearColor
    self.backgroundColor = [UIColor clearColor];
    return self;
}


+ (instancetype)messageViewWithTabelView:(UITableView *)tableView {
    static NSString *ID = @"message_cell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (void)setMessageFrame:(MessageFrame *)messageFrame {
    _messageFrame = messageFrame;
    Message *message = messageFrame.message;
    
    self.lblTime.text = message.time;
    self.lblTime.frame = messageFrame.timeFrame;
    self.lblTime.hidden = messageFrame.message.hideTime;
    
    if (message.type) {
        self.imgViewIcon.image =  [UIImage imageNamed:@"other"];
    } else {
        self.imgViewIcon.image =  [UIImage imageNamed:@"me"];
    }
    self.imgViewIcon.frame = messageFrame.iconFrame;
    
    [self.btnText setTitle:message.text forState:UIControlStateNormal];
    self.btnText.frame = messageFrame.textFrame;
    
    
    NSString *nor, *highlight;
    if (self.messageFrame.message.type == MessageTypeMe) {
        nor = @"chat_send_nor";
        highlight = @"chat_send_press_pic";
        
        // 设置消息文字颜色
        [self.btnText setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    } else {
        nor = @"chat_recive_nor";
        highlight = @"chat_recive_press_pic";
        
        [self.btnText setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    UIImage *imgNor = [UIImage imageNamed:nor];
    UIImage *imgHigh = [UIImage imageNamed:highlight];
    // 平铺的方式拉伸图片
    imgNor = [imgNor stretchableImageWithLeftCapWidth:imgNor.size.width * 0.5 topCapHeight:imgNor.size.height * 0.5];
    imgHigh = [imgHigh stretchableImageWithLeftCapWidth:imgHigh.size.width * 0.5 topCapHeight:imgHigh.size.height * 0.5];
    [self.btnText setBackgroundImage:imgNor forState:UIControlStateNormal];
    [self.btnText setBackgroundImage:imgHigh forState:UIControlStateHighlighted];
    //        self.btnText.backgroundColor = [UIColor greenColor];
    // 设置按钮的内边距
    _btnText.contentEdgeInsets = UIEdgeInsetsMake(15, 20, 15, 20);
    
    
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
