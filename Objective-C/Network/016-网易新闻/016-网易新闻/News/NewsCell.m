//
//  NewsCell.m
//  016-网易新闻
//
//  Created by Peyet-Zhao on 2021/11/23.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "NewsCell.h"
#import <UIImageView+AFNetworking.h>

@interface NewsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgsrc;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *digest;
@property (weak, nonatomic) IBOutlet UILabel *replyCount;

@end

@implementation NewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setNews:(News *)news {
    [self.imgsrc setImageWithURL:[NSURL URLWithString:news.imgsrc]];
    self.title.text = news.title;
    self.digest.text = news.digest;
    self.replyCount.text = [NSString stringWithFormat:@"%d 人评论", news.replyCount.intValue];
}

@end
