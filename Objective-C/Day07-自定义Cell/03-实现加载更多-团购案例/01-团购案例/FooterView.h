//
//  FooterView.h
//  01-团购案例
//
//  Created by Peyet-Zhao on 2021/9/13.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FooterView;
@protocol FooterViewDelegate <NSObject>
@required
- (void)footerViewUpdateData:(FooterView *)footerView;
@end

@interface FooterView : UIView

// UI控件的代理必须是weak !!!
@property (nonatomic, weak) id<FooterViewDelegate> delegate;

+ (instancetype)footerView;

@end

NS_ASSUME_NONNULL_END
