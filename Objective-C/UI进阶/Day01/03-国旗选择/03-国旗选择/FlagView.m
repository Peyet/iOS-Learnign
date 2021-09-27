//
//  FlagView.m
//  03-国旗选择
//
//  Created by Peyet-Zhao on 2021/9/27.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "FlagView.h"

@interface FlagView ()
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIImageView *imgFlag;

@end

@implementation FlagView

- (void)setFlag:(Flag *)flag {
    _flag = flag;
    
    self.lblName.text = flag.name;
    self.imgFlag.image = [UIImage imageNamed:flag.icon];
}

- (instancetype)initWithPickerView:(UIPickerView *)pickerView {
    FlagView *flagView = [[[NSBundle mainBundle] loadNibNamed:@"FlagView" owner:nil options:nil] lastObject];
    
    return flagView;
}

+ (instancetype)flagViewWithPickerView:(UIPickerView *)pickerView {
    return [[self alloc] initWithPickerView:pickerView];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
