//
//  ViewController.m
//  05-归档解档
//
//  Created by Peyet-Zhao on 2021/10/2.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)save:(id)sender {
    Person *p = [Person new];
    p.name = @"YOUR HEART";
    p.age = 18;
    
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"person.data"];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:p requiringSecureCoding:YES error:nil];
    
    [data writeToFile:filePath atomically:YES];
    
    NSLog(@"%@", p.name);
}
- (IBAction)read:(id)sender {
    
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"person.data"];
    
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    Person *p = [NSKeyedUnarchiver unarchivedObjectOfClass:[Person class] fromData:data error:nil];
    
    NSLog(@"Unarchive : %@", p.name);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
