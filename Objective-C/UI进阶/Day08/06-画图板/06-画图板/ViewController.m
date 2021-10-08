//
//  ViewController.m
//  06-画图板
//
//  Created by Peyet-Zhao on 2021/10/8.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet DrawView *drawView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController
- (IBAction)widthChange:(UISlider *)sender {
    self.drawView.lineWidth = sender.value;
    NSLog(@"lineWidth : %f", self.drawView.lineWidth);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.drawView.lineWidth = self.slider.value;
    [self setColor:self.button];
    
}

- (IBAction)setColor:(UIButton *)sender {
    self.drawView.color = sender.backgroundColor;
}

@end
