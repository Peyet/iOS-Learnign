//
//  GoodsCell.h
//  01-团购案例
//
//  Created by Peyet-Zhao on 2021/9/13.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Goods.h"

NS_ASSUME_NONNULL_BEGIN
//@class Goods;
@interface GoodsCell : UITableViewCell

@property (nonatomic, strong) Goods *goods;

// 封装创建自定义Cell的方法
+ (instancetype)goodsCellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
