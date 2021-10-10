//
//  RotateView.h
//  01-大转盘
//
//  Created by Peyet-Zhao on 2021/10/10.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^Alert)(UIAlertController * alertController);
@interface RotateView : UIView

@property (nonatomic, copy) Alert alert;

+ (instancetype)rotateView ;
- (void)startRotate;

@end

NS_ASSUME_NONNULL_END
