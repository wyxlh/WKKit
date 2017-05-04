//
//  HomeBannerTableViewCell.m
//  WKKit
//
//  Created by 王宇 on 16/9/20.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "HomeBannerTableViewCell.h"
#import "WKBanner.h"
@implementation HomeBannerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(void)setModel:(HomeModel *)model{
    WKBanner *banner=[[WKBanner alloc]initWithFrame:self.contentView.bounds ImageArr:model];
    [self addSubview:banner];
}

@end
