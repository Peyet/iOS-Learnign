//
//  headlineCell.h
//  016-网易新闻
//
//  Created by Peyet-Zhao on 2021/11/22.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class Headline;
@interface headlineCell : UICollectionViewCell

@property (nonatomic, strong) Headline *headline;

@end

NS_ASSUME_NONNULL_END
