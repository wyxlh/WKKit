//
//  CSIIitemCell.h
//  wuxiangongdong
//
//  Created by 孙启鹏 on 16/10/13.
//  Copyright © 2016年 孙启鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSIIitemModel.h"

@class CSIIitemModel;

@interface CSIIitemCell : UICollectionViewCell

@property (nonatomic, strong) CSIIitemModel *model;
@property (nonatomic, copy) UIColor *backColor;
@end
