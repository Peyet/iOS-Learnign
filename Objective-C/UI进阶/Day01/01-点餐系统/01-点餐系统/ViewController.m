//
//  ViewController.m
//  01-点餐系统
//
//  Created by Peyet-Zhao on 2021/9/25.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *lblFruit;
@property (weak, nonatomic) IBOutlet UILabel *lblMainFood;
@property (weak, nonatomic) IBOutlet UILabel *lblDrink;

@property (nonatomic, strong) NSArray *foods;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
- (IBAction)btnRandom:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self pickerView:self.pickerView didSelectRow:1 inComponent:2];
    
    for (int i = 0; i < self.foods.count; i++) {
        [self pickerView:self.pickerView didSelectRow:0 inComponent:i];
    }
}

- (NSArray *)foods {
    if (_foods == nil) {
        _foods = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"01foods.plist" ofType:nil]];
    }
    return _foods;
}

#pragma mark  - 数据源方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.foods.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.foods[component] count];
}

#pragma mark - 代理方法
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    NSArray *foodItem = self.foods[component];
//    return foodItem[row];
    return self.foods[component][row];
}

// 选中数据的事件
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString *selectedData = self.foods[component][row];
    NSLog(@"%@", selectedData);
    
    switch (component) {
        case 0:
            self.lblFruit.text = selectedData;
            break;
        case 1:
            self.lblMainFood.text = selectedData;
            break;
        case 2:
            self.lblDrink.text = selectedData;
            break;
    }
}


- (IBAction)btnRandom:(UIButton *)sender {
    for (int i = 0; i < self.foods.count; i++) {
        NSUInteger count = [self.foods[i] count];
        u_int32_t ranNumber = arc4random_uniform((int32_t)count);
        
        // 检查是否与当前选中的数据相同
        NSInteger currentRow = [self.pickerView selectedRowInComponent:i];
        while (currentRow == ranNumber) {
            // make a random number
            ranNumber = arc4random_uniform((int32_t)count);
        }
        
        // select row
        [self.pickerView selectRow:ranNumber inComponent:i animated:YES];
        
        [self pickerView:self.pickerView didSelectRow:ranNumber inComponent:i];
    }
}
@end
