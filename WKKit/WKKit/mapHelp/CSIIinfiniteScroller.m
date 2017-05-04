//
//  CSIIinfiniteScroller.m
//  wuxiangongdong
//
//  Created by 孙启鹏 on 16/10/13.
//  Copyright © 2016年 孙启鹏. All rights reserved.
//

#import "CSIIinfiniteScroller.h"
#import "CSIIitemCell.h"
#import "CSIIitemModel.h"
#import "LZBFlowLayout.h"
#define CSIICellIdentifier @"images"
#define CSIIMaxSections 50
#define CSIIColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

#define selectColoer [UIColor redColor]
#define nomoleColoer [UIColor blackColor]
@interface CSIIinfiniteScroller ()<UICollectionViewDelegate, UICollectionViewDataSource,CSIILayoutDelegates>

@property(nonatomic, weak) UICollectionView *collectionView;
@property(nonatomic, copy) NSMutableArray *images;
@property(nonatomic, copy) NSMutableArray *dataSource;
@property(nonatomic, assign) CGFloat itemSize;
@property(nonatomic, assign) CGFloat itemGap;
/**
 title选中  颜色选中
 */
@property(nonatomic, assign) NSInteger titleSelectItem,colorSelectItem;
@end

@implementation CSIIinfiniteScroller

-(NSMutableArray *)images
{
    if (_images == nil) {
        _images = [NSMutableArray array];
        for (int i = 0; i < self.dataSource.count ; i++) {
            CSIIitemModel *model = [[CSIIitemModel alloc] init];
            model.time = self.dataSource[i];
            [_images addObject:model];
        }
        
    }
    return _images;
}
-(NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

-(instancetype)initWithFrame:(CGRect)frame dataSourceWith:(NSMutableArray *)images speedWith:(CGFloat )speed withItemSize:(CGFloat)itemSize selectItme:(NSInteger)index
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSource = images;
        self.itemSize = itemSize;
        self.titleSelectItem = index;
        self.colorSelectItem = index+2;
        if (self.colorSelectItem==self.dataSource.count) {
            self.colorSelectItem=0;
        }else if (self.colorSelectItem>self.dataSource.count){
            self.colorSelectItem=self.colorSelectItem-self.dataSource.count;
        }
        [self createCollectionView];
    }
    return self;
}


-(void)createCollectionView
{
    //1.增加UIcollectionView
    LZBFlowLayout *flow =[[LZBFlowLayout alloc]init];
    //1.1.布局item,设置item的大小
    flow.itemSize =CGSizeMake(self.itemSize, self.itemSize);
    flow.delegates=self;
    CGFloat itemGap = (self.frame.size.width - self.itemSize * 5) / 4;
    self.itemGap = itemGap;
    //1.2.设置item的间距离
    flow.minimumInteritemSpacing =0;
    flow.minimumLineSpacing = itemGap;
    //1.3 设置距离左边的距离
    
    flow.sectionInset = UIEdgeInsetsMake(0, itemGap, 0, 0);
    flow.scrollDirection =UICollectionViewScrollDirectionHorizontal;
    
    
    
    UICollectionView *coll = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-100, 30) collectionViewLayout:flow];;
    [self addSubview:coll];
    self.collectionView = coll;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.pagingEnabled = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView registerClass:[CSIIitemCell class] forCellWithReuseIdentifier:CSIICellIdentifier];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.titleSelectItem inSection:(CSIIMaxSections/2) -1]  atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return CSIIMaxSections;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CSIIitemCell * cell = (CSIIitemCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CSIICellIdentifier forIndexPath:indexPath];
    cell.model = self.images[indexPath.item];
    if (self.titleSelectItem<self.dataSource.count-2) {
        if (indexPath == [NSIndexPath indexPathForItem:self.colorSelectItem inSection:(CSIIMaxSections/2-1)]) {
            cell.backColor = selectColoer;
        }
    }else{
        if (indexPath == [NSIndexPath indexPathForItem:self.colorSelectItem inSection:(CSIIMaxSections/2)]) {
            cell.backColor = selectColoer;
        }
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *oldVisiblePaths = [self.collectionView indexPathsForVisibleItems];
    for (NSIndexPath *indexPath in oldVisiblePaths)
    {
        CSIIitemCell *allcell = (CSIIitemCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        allcell.backColor = nomoleColoer;
    }
    
    NSInteger itemIn = indexPath.item - 2;
    NSInteger itemSCtion = CSIIMaxSections/2;
    if (indexPath.item == 0) {
        itemIn = self.dataSource.count - 2;
        itemSCtion = itemSCtion - 1;
    }else if ( indexPath.item == 1) {
        itemIn = self.dataSource.count - 1;
        itemSCtion = itemSCtion - 1;
    }
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:itemIn inSection:itemSCtion]  atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    if ([self.delegates respondsToSelector:@selector(didSelectImageAtIndexPathItem:)]) {
        [self.delegates didSelectImageAtIndexPathItem:indexPath.item];
    }
    
    CSIIitemCell *redCell = (CSIIitemCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:indexPath.item inSection: CSIIMaxSections/2]];
    redCell.backColor = selectColoer;
    
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    int s =  scrollView.contentOffset.x/(self.itemSize + self.itemGap);
    int i =  ((int)s + 3)%self.dataSource.count;
    int ss = i - 1;
    if (i == 0) {
        ss = (int)self.dataSource.count - 1;
    }
    if ([self.delegates respondsToSelector:@selector(didSelectImageAtIndexPathItem:)]) {
        [self.delegates didSelectImageAtIndexPathItem:ss];
    }
    
    NSArray *visiblePaths = [self.collectionView indexPathsForVisibleItems];
    for (int i = 0; i < visiblePaths.count ; i++) {
        NSIndexPath *indexPath = visiblePaths[i];
        CSIIitemCell *allcell = (CSIIitemCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        CGFloat cellCenter =  (allcell.center.x - scrollView.contentOffset.x);
        if (cellCenter == self.frame.size.width/2) {
            allcell.backColor = selectColoer;
        }
    }
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSArray *visiblePaths = [self.collectionView indexPathsForVisibleItems];
    for (NSIndexPath *indexPath in visiblePaths)
    {
        CSIIitemCell *allcell = (CSIIitemCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        allcell.backColor = nomoleColoer;
    }
}


-(void)itemWithIndexPath:(NSIndexPath *)indexPath{
    CSIIitemCell *allcell = (CSIIitemCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    [UIView animateWithDuration:1 animations:^{
        allcell.backColor = selectColoer;
    }];
}









@end
