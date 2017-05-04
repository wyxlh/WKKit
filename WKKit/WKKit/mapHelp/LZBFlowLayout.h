//
//  LZBFlowLayout.h
//  UIcollectionView的基本使用
//
//  Created by Apple on 15/11/26.
//  Copyright © 2015年 LZB. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CSIILayoutDelegates <NSObject>
- (void)itemWithIndexPath:(NSIndexPath *)indexPath;
@end
@interface LZBFlowLayout : UICollectionViewFlowLayout
@property (nonatomic, weak) id<CSIILayoutDelegates> delegates;
@end
