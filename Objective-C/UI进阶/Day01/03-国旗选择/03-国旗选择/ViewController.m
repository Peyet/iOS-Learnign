//
//  ViewController.m
//  03-国旗选择
//
//  Created by Peyet-Zhao on 2021/9/26.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "Flag.h"
#import "FlagView.h"


@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSArray *flags;

@end

@implementation ViewController

- (NSArray *)flags {
    if (_flags == nil) {
        NSArray *arrayOfDict = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"03flags.plist" ofType:nil]];
        NSMutableArray *arrayOfModel = [NSMutableArray new];
        for (NSDictionary *dict in arrayOfDict) {
            Flag *flag = [Flag flagWithDict:dict];
            [arrayOfModel addObject:flag];
        }
        _flags = [arrayOfModel copy];
    }
    return _flags; 
}


#pragma mark - UIPickerViewDelegate

//- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    Flag *flag = self.flags[row];
//    return flag.name;
//}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    // get data
    Flag *model = self.flags[row];
    
    // 创建view
    FlagView *flagView = [FlagView flagViewWithPickerView:pickerView];
    
    // 将数据设置给view
    flagView.flag = model;
    
    // 返回cell
    return flagView;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 85;
}


#pragma mark - UIPickerViewDataSource
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.flags.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
