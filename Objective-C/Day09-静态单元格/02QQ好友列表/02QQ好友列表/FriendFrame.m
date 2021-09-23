//
//  FriendFrame.m
//  02QQ好友列表
//
//  Created by Peyet-Zhao on 2021/9/20.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "FriendFrame.h"

#define fontOfName [UIFont systemFontOfSize:18]
#define fontOfIntro [UIFont systemFontOfSize:10]

@implementation FriendFrame

- (void)setFriend:(Friend *)friend {
    _friend = friend;
    
    CGFloat margin = 5;
    
    // icon
    CGFloat iconX = 5,
            iconY = 5,
            iconW = 40,
            iconH = 40;
    self.icon = CGRectMake(iconX, iconY, iconW, iconH);

    // name
    CGFloat nameX = CGRectGetMaxX(self.icon)+ margin,
    nameY = margin,
    nameW,
    nameH;
    CGSize nameSize = [friend.name sizeOfStringWithMaxSize:CGSizeMake(200, 25) andFont:fontOfName];
    nameW = nameSize.width;
    nameH = nameSize.height;
    self.name = CGRectMake(nameX, nameY, nameW, nameH);


    // vip
    CGFloat vipX = CGRectGetMaxX(self.name) + margin,
            vipY = margin,
            vipW = 15,
            vipH = 15;
    self.vip = CGRectMake(vipX, vipY, vipW, vipH);
    
    // intro
    CGFloat introX = CGRectGetMaxX(self.icon)+ margin,
    introY = CGRectGetMaxY(self.name),
    introW,
    introH;
    CGSize introSize = [friend.intro sizeOfStringWithMaxSize:CGSizeMake(370, 20) andFont:fontOfIntro];
    introW = introSize.width;
    introH = introSize.height;
    self.intro = CGRectMake(introX, introY, introW, introH);

    _rowHeight = 60;
    
}

@end
