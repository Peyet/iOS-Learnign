//
//  ViewController.m
//  02-省市选择
//
//  Created by Peyet-Zhao on 2021/9/25.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "city.h"

@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *province;
@property (weak, nonatomic) IBOutlet UILabel *city;

@property (nonatomic, strong) NSArray *cities;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

// 暂存选中的省
@property (nonatomic, strong) city *tempProvince;


@end

@implementation ViewController


- (NSArray *)cities {
    if (_cities == nil) {
        NSArray *arrayOfDict = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"02cities.plist" ofType:nil]];
        NSMutableArray *arrayOfModel = [NSMutableArray new];
        for (NSDictionary *dict in arrayOfDict) {
            city *model = [city cityWithDict:dict];
            [arrayOfModel addObject:model];
        }
        _cities = arrayOfModel;
    }
    return _cities;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self pickerView:self.pickerView didSelectRow:0 inComponent:0];
    [self pickerView:self.pickerView didSelectRow:0 inComponent:1];
}

#pragma mark - <DataSource>

// 数据源
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    NSLog(@"000000000");
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    long rst;
    if (component == 0) {
        rst = self.cities.count;
        NSLog(@"aaaaaaaaa");
    } else {
//        city *model = self.cities[[pickerView selectedRowInComponent:0]];
//        rst = model.cities.count;
        self.tempProvince = self.cities[[pickerView selectedRowInComponent:0]];
        NSLog(@"bbbbbbbbbb");
        rst = self.tempProvince.cities.count;
    }
    return rst;
}

#pragma mark - PickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    city *model;
    NSString *rst;
    if (component == 0) {
        NSLog(@"cccccccccc");
        model = self.cities[row];
        rst = model.name;
    } else {
//        model = self.cities[[pickerView selectedRowInComponent:0]];
//        rst = model.cities[row];
        NSLog(@"dddddddddd");
        rst = self.tempProvince.cities[row];
    }
    return rst;
}

// 更新市的内容
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    city *model = self.cities[[pickerView selectedRowInComponent:0]];
    if (component == 0) {
        NSLog(@"eeeeeeeeeee");
        //        [self pickerView:pickerView titleForRow:0 forComponent:1];
        [pickerView reloadComponent:1];
        self.province.text = model.name;

        [self.pickerView selectRow:0 inComponent:1 animated:YES];

    } else {
        NSLog(@"fffffffff");
//        self.city.text = model.cities[row];
        self.city.text = self.tempProvince.cities[row];
    }
}


@end
