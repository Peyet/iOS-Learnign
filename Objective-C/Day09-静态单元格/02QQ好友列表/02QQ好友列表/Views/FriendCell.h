//
//  FriendCell.h
//  02QQ好友列表
//
//  Created by Peyet-Zhao on 2021/9/20.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friend.h"
#import "FriendFrame.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendCell : UITableViewCell

@property (nonatomic, strong) FriendFrame *friendFrame;

@property (nonatomic, weak) UIImageView *imgIcon;
@property (nonatomic, weak) UILabel *lblName;
@property (nonatomic, weak) UIImageView *imgVip;
@property (nonatomic, weak) UILabel *lblIntro;

//- (instancetype)initWithFriendFrame:(FriendFrame *)friendFrame;

//+ (instancetype)friendWithFriendFrame:(FriendFrame *)friendFrame;

+ (instancetype)friendWithTableView:(UITableView *)tableView;


@end

NS_ASSUME_NONNULL_END
