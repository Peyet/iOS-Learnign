//
//  AppCell.h
//  04应用下载
//
//  Created by Peyet-Zhao on 2021/9/23.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "App.h"
NS_ASSUME_NONNULL_BEGIN

@class AppCell;
@protocol AppCellDelegate <NSObject>

@required
- (void)appCellDidDownloadButton:(AppCell *)appCell;

@end


@interface AppCell : UITableViewCell

@property (nonatomic, strong) App *app;
@property (nonatomic, weak) id<AppCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *btnDownload;


+ (instancetype)appWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
