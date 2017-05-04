//
//  HomeBannerTableViewCell.h
//  WKKit
//
//  Created by 王宇 on 16/9/20.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
@interface HomeBannerTableViewCell : UITableViewCell<UIScrollViewDelegate>
@property (nonatomic,strong)HomeModel *model;
@end
