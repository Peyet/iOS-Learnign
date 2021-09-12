//
//  ViewController.m
//  Day06-06-优化版-汽车品牌展示
//
//  Created by Peyet-Zhao on 2021/9/11.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, strong) NSArray *cars;

@end

@implementation ViewController

- (NSArray *)cars {
    if (_cars == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
        NSArray *arrayOfDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayOfModel = [NSMutableArray new];
        for (NSDictionary *dict in arrayOfDict) {
            Car *car = [Car carWithDict:dict];
            [arrayOfModel addObject:car];
        }
        _cars = arrayOfModel;
        
    }
    return _cars;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cars.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    Car *car = self.cars[section];
    return car.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // get model
    Car *car = self.cars[indexPath.section];
    
    
    // create cell
    NSString *ID = @"cars";
    static UITableViewCell *cell;
    cell = [cell initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    // set data
    cell.textLabel.text = car
    cell.foot
    
    return cell;
}

@end

