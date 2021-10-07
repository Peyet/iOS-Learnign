//
//  ButtonView.h
//  04-手势解锁
//
//  Created by Peyet-Zhao on 2021/10/6.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ButtonView : UIView

@property (nonatomic, strong) BOOL (^passwordBlock)(NSString*);

@end

NS_ASSUME_NONNULL_END
