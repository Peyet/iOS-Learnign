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

- (IBAction)save:(id)sender {
    UIGraphicsBeginImageContextWithOptions(self.drawView.bounds.size, NO, 0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [self.drawView.layer renderInContext:ctx];
    
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
}
- (IBAction)clear:(id)sender {
    [self.drawView clear];
}
- (IBAction)back:(id)sender {
    [self.drawView back];
}
- (IBAction)eraser:(id)sender {
    [self.drawView eraser];
}

@end
