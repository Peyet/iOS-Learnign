//
//  FlagView.h
//  03-国旗选择
//
//  Created by Peyet-Zhao on 2021/9/27.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Flag.h"

NS_ASSUME_NONNULL_BEGIN

@interface FlagView : UIView

@property (nonatomic, strong) Flag *flag;

- (instancetype)initWithPickerView:(UIPickerView *)pickerView;
+ (instancetype)flagViewWithPickerView:(UIPickerView *)pickerView;

@end

NS_ASSUME_NONNULL_END
