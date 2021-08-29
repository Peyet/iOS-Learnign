//
//  ViewController.m
//  Day02-PictureViewer
//
//  Created by Peyet-Zhao on 2021/8/29.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *pic;
@property (weak, nonatomic) IBOutlet UILabel *lblIndex;
@property (nonatomic, assign) int index;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;

- (IBAction)next;
- (IBAction)previous;

@end

@implementation ViewController

// ----------------------懒加载数据-----------------------
- (NSArray *)pic {
    if (_pic == nil) {
//        加载pic.plist 文件中的数据到_pic
//        1.获取pic的文件路径
//        [NSBundle mainBundle] 表示获取这个安装app在手机上的根目录
//        然后在app的安装的根目录下搜索 pic.plist
        NSString *path = [[NSBundle mainBundle] pathForResource:@"pic.plist" ofType:nil];
        
//        2.读取文件
        NSArray *arrayOfPic = [NSArray arrayWithContentsOfFile:path];
        
        _pic = arrayOfPic;
        NSLog(@"%ld", _pic.count);
        NSLog(@"%@", _pic);
    }
    return _pic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.pic;
//    self.imageView.image = [UIImage imageNamed:self.pic[0][@"icon"]];
//
//    self.text.text = self.pic[0][@"title"];
//
//    self.lblIndex.text = [NSString stringWithFormat:@"1 / %lu", _pic.count];
//
//    self.leftButton.enabled = NO;
    
    [self setData:0];
}


- (IBAction)next {
    self.index++;
    [self setData:_index];
    
//    self.leftButton.enabled = YES;
//
//    self.index++;
////    取出pic.plist中Array中的Dictionary元素
//    NSDictionary *dicOfPic = self.pic[self.index];
////    显示title
//    _lblIndex.text = [NSString stringWithFormat:@"%d / %lu", _index + 1, self.pic.count];
////    显示图片
//    self.imageView.image = [UIImage imageNamed:dicOfPic[@"icon"]];
////    显示介绍
//    self.text.text = dicOfPic[@"title"];
////    next按钮是否可点击
//    if (self.index == self.pic.count-1) {
//        self.rightButton.enabled = NO;
//    } else {
//         self.rightButton.enabled = YES;
//    }
}

- (IBAction)previous {
    self.index--;
    [self setData:_index];
    
//    self.rightButton.enabled = YES;
//
//    self.index--;
//
//    self.lblIndex.text = [NSString stringWithFormat:@"%d / %lu", _index + 1, _pic.count];
//
//    self.imageView.image = [UIImage imageNamed:self.pic[self.index][@"icon"]];
//
//    self.text.text = self.pic[_index][@"title"];
//
//    _leftButton.enabled = _index != 0;
}

- (void)setData:(int)index {
//    取出pic.plist中Array中的Dictionary元素
    NSDictionary *dicOfPic = self.pic[self.index];
//    显示title
    _lblIndex.text = [NSString stringWithFormat:@"%d / %lu", _index + 1, self.pic.count];
//    显示图片
    self.imageView.image = [UIImage imageNamed:dicOfPic[@"icon"]];
//    显示介绍
    self.text.text = dicOfPic[@"title"];

    self.leftButton.enabled = self.index != 0;
    self.rightButton.enabled = self.index != self.pic.count-1;
}

@end
