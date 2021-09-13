//
//  GoodsCell.m
//  01-团购案例
//
//  Created by Peyet-Zhao on 2021/9/13.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "GoodsCell.h"

@interface GoodsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelBuyCount;

@end

@implementation GoodsCell

- (void)setGoods:(Goods *)goods {
    _goods = goods;
    self.imageViewIcon.image = [UIImage imageNamed:self.goods.icon];
    self.labelTitle.text = self.goods.title;
    self.labelPrice.text = [NSString stringWithFormat:@"¥ %@", self.goods.price];
    self.labelBuyCount.text = [NSString stringWithFormat:@"%@人已购买", self.goods.buyCount];
}

+ (instancetype)goodsCellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"Goods_Cell";
    GoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 通过xib的方式创建单元格
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GoodsCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
