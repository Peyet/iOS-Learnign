//
//  AppCell.m
//  04应用下载
//
//  Created by Peyet-Zhao on 2021/9/23.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "AppCell.h"

@interface AppCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblDetail;

- (IBAction)btnClicked:(UIButton *)sender;

@end

@implementation AppCell

+ (instancetype)appWithTableView:(UITableView *)tableView {
    static NSString *ID = @"app_cell";
    AppCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    return cell;
}

- (void)setApp:(App *)app {
    _app = app;
    
    // icon
    self.imgIcon.image = [UIImage imageNamed:app.icon];
    
    // name
    self.lblName.text = app.name;
    
    // detail
    self.lblDetail.text = [NSString stringWithFormat:@"大小: %@ | 下载量: %@", app.size, app.download];
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnClicked:(UIButton *)sender {
    
    [self.btnDownload setTitle:@"下载中" forState:UIControlStateNormal];
    
    [self.delegate appCellDidDownloadButton:self];
    
}
@end
