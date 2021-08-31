//
//  ViewController.m
//  Day03-ApplicationDownloader
//
//  Created by Peyet-Zhao on 2021/8/30.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "MyApp.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *apps;

@end

@implementation ViewController

- (NSArray *)apps {
    
    if ( _apps == nil) {
        // 字典转模型
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        NSArray *arrayOfDictionary = [NSArray arrayWithContentsOfFile:path];
        // 创建一个可变数组用来保存一个一个的模型对象
        NSMutableArray *arrayOfModels = [NSMutableArray array];
        // 循环字典数组, 把每个字典对象转换成一个模型对象
        for (NSDictionary *dict in arrayOfDictionary) {
            // 创建模型
            MyApp *model = [[MyApp alloc] initWithDict:dict];
//            model.name = dict[@"name"];
//            model.icon = dict[@"icon"];
            // 把字典加入到arrayModels 中
            [arrayOfModels addObject:model];
        }
        _apps = arrayOfModels;
    }
    return _apps;


 /*
    if ( _apps == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        _apps = [NSArray arrayWithContentsOfFile:path];
    }
    return _apps;
  */
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int colums = 3;
    CGFloat viewWidth = self.view.frame.size.width;
    
    CGFloat appW = 80;
    CGFloat appH = 110;
    CGFloat marginTop = 100;
    CGFloat marginX = (viewWidth - appW * colums) / (colums + 1);
    CGFloat marginY = marginX;

    for (int i = 0; i < self.apps.count; i++) {
        // 创建每个应用的容器view
        UIView *appView = [UIView new];
        // 设置背景颜色
//        appView.backgroundColor = [UIColor blueColor];
        // 设置大小和位置
        CGFloat appX = marginX + (marginX + appW) * (i % colums);
        CGFloat appY = marginTop + (marginY + appH) * (i / colums);
        appView.frame = CGRectMake(appX, appY, appW, appH);
        // 添加到view中
        [self.view addSubview:appView];
        
        // 向控件中添加子控件
        // 创建控件
        UIImageView *img = [UIImageView new];
//        img.backgroundColor = [UIColor greenColor];
//        [img setImage:[UIImage imageNamed: self.apps[i][@"icon"]]];
//        字典写法
        MyApp *dict = self.apps[i];
        [img setImage:[UIImage imageNamed:dict.icon]];
        
        //label
        UILabel *lbl = [UILabel new];
        
        //字典写法
//        lbl.text = self.apps[i][@"name"];
        lbl.text = dict.name;
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textAlignment = NSTextAlignmentCenter;
        
        //button
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"下载" forState:UIControlStateNormal];
        [btn setTitle:@"已安装" forState:UIControlStateDisabled];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
//        btn.backgroundColor = [UIColor yellowColor];
        [btn setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
        
        
        // 向appView中添加
        [appView addSubview:img];
        [appView addSubview:lbl];
        [appView addSubview:btn];
        // 设置子控件的大小
        img.frame = CGRectMake(10, 0, 60, 60);
        lbl.frame = CGRectMake(0, 60, 80, 20);
        btn.frame = CGRectMake(10, 80, 60, 30);
        
        
        
        // 为按钮注册一个单击事件
        [btn addTarget:self action:@selector(btnDownloadClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
}

- (void)btnDownloadClick {
    NSLog(@"downloading..");
}

@end
