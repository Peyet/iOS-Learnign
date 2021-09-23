//
//  FriendCell.m
//  02QQ好友列表
//
//  Created by Peyet-Zhao on 2021/9/20.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "FriendCell.h"

@implementation FriendCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // icon
        UIImageView *imgIcon = [UIImageView new];
        self.imgIcon = imgIcon;
        [self.contentView addSubview:imgIcon];
        
        // name
        UILabel *lblName = [UILabel new];
        self.lblName = lblName;
        [self.contentView addSubview:lblName];
        
        // vip
        UIImageView *imgVip = [UIImageView new];
        self.imgVip = imgVip;
        imgVip.image = [UIImage imageNamed:@"009"];
        [self.contentView addSubview:imgVip];
        
        // intro
        UILabel *lblIntro = [UILabel new];
        self.lblIntro = lblIntro;
        [self.contentView addSubview:lblIntro];
    }
    return self;
}


//- (instancetype)initWithFriendFrame:(FriendFrame *)friendFrame {
//    if (self = [super init]) {
//
//        // icon
//        UIImageView *imgIcon = [UIImageView new];
//        self.imgIcon = imgIcon;
//        [self.contentView addSubview:imgIcon];
//
//        // name
//        UILabel *lblName = [UILabel new];
//        self.lblName = lblName;
//        [self.contentView addSubview:lblName];
//
//        // vip
//        UIImageView *imgVip = [UIImageView new];
//        self.imgVip = imgVip;
//        imgVip.image = [UIImage imageNamed:@"009"];
//        [self.contentView addSubview:imgVip];
//
//        // intro
//        UILabel *lblIntro = [UILabel new];
//        self.lblIntro = lblIntro;
//        [self.contentView addSubview:lblIntro];
//    }
//    return self;
//
//}


+ (instancetype)friendWithTableView:(UITableView *)tableView {
    static NSString *reuseidentifierID = @"friend_cell";
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseidentifierID];
    if (cell == nil) {
        cell = [[FriendCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseidentifierID];
    }
    return cell;
}

- (void)setFriendFrame:(FriendFrame *)friendFrame {
    _friendFrame = friendFrame;
    
    
    // data
    Friend *dataOfFriend = friendFrame.friend;
    // icon
    self.imgIcon.image = [UIImage imageNamed:dataOfFriend.icon];
    
    // name
    self.lblName.text = dataOfFriend.name;
    
    // vip
    if (dataOfFriend.vip == 0) {
        self.imgVip.hidden = YES;
    } else {
        self.imgVip.hidden = NO;
    }
    
    // intro
    self.lblIntro.text = dataOfFriend.intro;

    
    // frame
    // icon
    self.imgIcon.frame = friendFrame.icon;
    
    // name
    self.lblName.frame = friendFrame.name;
    
    // vip
    self.imgVip.frame = friendFrame.vip;
    
    // intro
    self.lblIntro.frame = friendFrame.intro;
    
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
