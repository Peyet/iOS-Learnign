//
//  NewsCell.h
//  016-网易新闻
//
//  Created by Peyet-Zhao on 2021/11/23.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsCell : UITableViewCell

@property (nonatomic, strong) News *news;

@end

NS_ASSUME_NONNULL_END
