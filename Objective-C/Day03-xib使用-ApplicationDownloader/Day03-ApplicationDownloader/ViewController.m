//
//  ViewController.m
//  Day03-ApplicationDownloader
//
//  Created by Peyet-Zhao on 2021/8/30.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "ViewController.h"
#import "MyApp.h"
#import "MyAppView.h"

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
        // 通过xib自动创建
        // 获取xib文件 (当xib文件部署到手机上的时候, 就会变成*.nib)
        MyAppView *appView = [[[NSBundle mainBundle] loadNibNamed:@"MyApp" owner:nil options:nil] firstObject];
        
        // 设置大小和位置
        CGFloat appX = marginX + (marginX + appW) * (i % colums);
        CGFloat appY = marginTop + (marginY + appH) * (i / colums);
        appView.frame = CGRectMake(appX, appY, appW, appH);

        // 添加到view中
        [self.view addSubview:appView];
        
        
        MyApp *appModel = self.apps[i];
        
        // 为控件添加数据
        /*  ⬇️耦合性太紧, 必须依赖于view中的Tag
        UIImageView *imgView = [appView viewWithTag:1];
        imgView.image = [UIImage imageNamed:appModel.icon];
        
        UILabel *lbl = [appView viewWithTag:2];
        lbl.text = appModel.name;
         */
        
        /* 第二版 (设置图片, title)
         appView.imgViewIcon.image = [UIImage imageNamed:appModel.icon];
         appView.lblName.text = appModel.name;
         */
        // 第三版
        appView.model = appModel;
        
    }
}

- (void)btnDownloadClick {
    NSLog(@"downloading..");
}

@end
