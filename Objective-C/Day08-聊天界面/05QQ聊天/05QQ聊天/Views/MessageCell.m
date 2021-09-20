//
//  MessageCell.m
//  05QQ聊天
//
//  Created by Peyet-Zhao on 2021/9/19.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "MessageCell.h"
#import <UIKit/UIKit.h>
#define textFont [UIFont systemFontOfSize:18]


@interface MessageCell ()
@property (nonatomic, weak) UILabel *lblTime;
@property (nonatomic, weak) UIImageView *imgIcon;
@property (nonatomic, weak) UIButton *btnText;


@end

@implementation MessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // TODO create series UIViews
        // Views
        UILabel *lblTime = [UILabel new];
        self.lblTime = lblTime;
        lblTime.textAlignment = NSTextAlignmentCenter;
        // !!!!!!!!!!!!!!!!!!!!!!⬇️重要⬇️!!!!!!!!!!!!!!!!!!!!
        [self.contentView addSubview:lblTime];
        
        UIImageView *imgIcon = [UIImageView new];
        self.imgIcon = imgIcon;
        [self.contentView addSubview:self.imgIcon];
        
        UIButton *btnText = [UIButton new];
        self.btnText = btnText;
        [self.contentView addSubview:self.btnText];
//        btnText.backgroundColor = [UIColor redColor];
        btnText.titleLabel.font = textFont;
        [btnText.titleLabel setTextColor:[UIColor blackColor]];
        btnText.titleLabel.numberOfLines = 0;

    }
    return self;
}

+ (instancetype)MessageCellWithTableView:(UITableView *)tableView {
    static NSString *reuseIdentifier = @"message_cell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    // 设置单元格的背景颜色
    [cell setBackgroundColor:[UIColor clearColor]];
    return cell;
}


- (void)setMessageFrame:(MessageFrame *)messageFrame {
    // set data
    _messageFrame = messageFrame;
    // tiem
    self.lblTime.text = messageFrame.message.time;
    // icon
    if (messageFrame.message.type == MessageTypeMe) {
        self.imgIcon.image = [UIImage imageNamed:@"me"];
    } else {
        self.imgIcon.image = [UIImage imageNamed:@"other"];
    }
    // text
//    self.btnText.titleLabel.text = messageFrame.message.text; // 错误的用法, 应使用setTitle
    [self.btnText setTitle:messageFrame.message.text forState:UIControlStateNormal];
    // text set background iamge
    NSString *nor, *highlight;
    if (messageFrame.message.type == MessageTypeMe) {
        nor = @"chat_send_nor";
        highlight = @"char_send_press_pic";
        [self.btnText setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    } else {
        nor = @"chat_recive_nor";
        highlight = @"chat_recive_press_pic";
        [self.btnText setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    UIImage *imgNor = [UIImage imageNamed:nor];
    UIImage *imgHighlight = [UIImage imageNamed:highlight];
    imgNor = [imgNor stretchableImageWithLeftCapWidth:imgNor.size.width * 0.5 topCapHeight:imgNor.size.height * 0.5];
    imgHighlight = [imgHighlight stretchableImageWithLeftCapWidth:imgHighlight.size.width *0.5 topCapHeight:imgHighlight.size.height * 0.5];
    
    [self.btnText setBackgroundImage:imgNor forState:UIControlStateNormal];
    [self.btnText setBackgroundImage:imgHighlight forState:UIControlStateHighlighted];
    [self.btnText setContentEdgeInsets:UIEdgeInsetsMake(15, 20, 15, 20)];

    
    // set frame
    self.lblTime.frame = messageFrame.lblTime;
    
    self.imgIcon.frame = messageFrame.imgIcon;
    
    self.btnText.frame = messageFrame.btnText;
    
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
