//
//  DrawView.h
//  06-画图板
//
//  Created by Peyet-Zhao on 2021/10/8.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DrawView : UIView

@property (nonatomic, assign) CGFloat lineWidth;

@property (nonatomic, strong) UIColor *color;


@end

NS_ASSUME_NONNULL_END
