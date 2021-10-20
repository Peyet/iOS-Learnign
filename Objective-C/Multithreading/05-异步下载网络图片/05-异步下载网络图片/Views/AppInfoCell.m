//
//  AppInfoCell.m
//  05-异步下载网络图片
//
//  Created by Peyet-Zhao on 2021/10/20.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "AppInfoCell.h"

@interface AppInfoCell ()
@property (nonatomic, strong) NSOperationQueue *queue;
@end

@implementation AppInfoCell

- (NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}

+ (instancetype)appInfoCellWith:(UITableView *)tableView {
    static NSString* reuseID = @"appInfoCell";
    AppInfoCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[AppInfoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseID];
    }
    return cell;
}
 
- (instancetype)model:(AppInfo *)model {
    self.textLabel.text = model.name;
    self.detailTextLabel.text = model.download;
    if (model.image) {
        self.imageView.image = model.image;
        NSLog(@"缓存图片");
    } else {
        NSLog(@"网络图片");
        // 设置占位图片
        self.imageView.image = [UIImage imageNamed:@"user_default"];
        
        [self.queue addOperationWithBlock:^{
            NSURL* url = [NSURL URLWithString:model.icon];
            NSData* data = [NSData dataWithContentsOfURL:url];
//            [NSThread sleepForTimeInterval:2];
            UIImage* image = [UIImage imageWithData:data];
            model.image = image;
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.imageView.image = image;
//                self.imageBlock(image);
            }];
        }];
    }
    return self;
}

@end
