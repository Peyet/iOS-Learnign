//
//  AppInfoCell.h
//  05-异步下载网络图片
//
//  Created by Peyet-Zhao on 2021/10/20.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppInfo.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^imageBlock)(UIImage* image);
@interface AppInfoCell : UITableViewCell

@property (nonatomic, strong) imageBlock imageBlock;


+ (instancetype)appInfoCellWith:(UITableView *)tableView;

- (instancetype)model:(AppInfo *)model;

@end

NS_ASSUME_NONNULL_END
