//
//  CSIIinfiniteScroller.h
//  wuxiangongdong
//
//  Created by 孙启鹏 on 16/10/13.
//  Copyright © 2016年 孙启鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CSIIScrollerViewDelegates <NSObject>
- (void)didSelectImageAtIndexPathItem:(NSInteger)indexPathItem;
@end

@interface CSIIinfiniteScroller : UIView
@property (nonatomic, weak) id<CSIIScrollerViewDelegates> delegates;
-(instancetype)initWithFrame:(CGRect)frame dataSourceWith:(NSMutableArray *)images speedWith:(CGFloat )speed withItemSize:(CGFloat)itemSize selectItme:(NSInteger)index;

@end

