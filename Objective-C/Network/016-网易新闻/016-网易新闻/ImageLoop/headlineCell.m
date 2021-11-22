//
//  headlineCell.m
//  016-网易新闻
//
//  Created by Peyet-Zhao on 2021/11/22.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "headlineCell.h"
#import "Headline.h"
#import <UIImageView+AFNetworking.h>

@interface headlineCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgsrcView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation headlineCell

- (void)setHeadline:(Headline *)headline {
    _headline = headline;
    
    self.imgsrcView.image = nil;
    self.titleView.text = nil;
//    NSLog(@"imgURL : %@", headline.imgsrc);
    [self.imgsrcView setImageWithURL:[NSURL URLWithString:headline.imgsrc]];
    self.titleView.text = headline.title;
    self.pageControl.currentPage = self.tag;
}

@end
