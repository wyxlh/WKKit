//
//  WKBanner.m
//  WKKit
//
//  Created by 王宇 on 16/9/20.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKBanner.h"

@interface WKBanner()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *scroView;
@property (nonatomic,strong)UIPageControl *pageControl;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)NSArray *ImageArr;
@end

@implementation WKBanner

-(instancetype)initWithFrame:(CGRect)frame ImageArr:(HomeModel *)model{
    self=[super initWithFrame:frame];
    self.ImageArr=model.promotionList;
//    [self createViewWithImagesArr:self.ImageArr];
    return self;
}
//
//#pragma mark 创建View
//-(void)createViewWithImagesArr:(NSArray *)ImagesArr{
//    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:self.bounds];
//    scrollView.delegate=self;
//    scrollView.showsHorizontalScrollIndicator = NO;
//    scrollView.pagingEnabled = YES;
//    self.scroView=scrollView;
//    scrollView.contentSize=CGSizeMake((ImagesArr.count+2)*ScreenWidth, self.mj_h);
//    scrollView.contentOffset = CGPointMake(ScreenWidth, 0);
//    [self addSubview:scrollView];
//    
//    //创建分页控件
//    UIPageControl *pageCtl = [[UIPageControl alloc] initWithFrame:CGRectMake(ScreenWidth/5-20, 40, 240.0, 30.0)];
//    //设置分页的个数
//    self.pageControl=pageCtl;
//    pageCtl.numberOfPages = [ImagesArr count];
//    pageCtl.currentPage = 0;
//    
//    //设置颜色
//    pageCtl.pageIndicatorTintColor = [UIColor colorWithRed:54.0/256.0 green:54.0/256.0 blue:54.0/256.0 alpha:1.0];
//    pageCtl.currentPageIndicatorTintColor = [UIColor colorWithRed:245.0/256.0 green:0.0/256.0 blue:100.0/256.0 alpha:1.0];
//    
//    [pageCtl addTarget:self action:@selector(pageClick:) forControlEvents:UIControlEventValueChanged];
//    [self addSubview:pageCtl];
//    
//    
//    if (_timer==nil) {
//        _timer=[NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(imgvScroll) userInfo:nil repeats:YES];
//    }
//    for (int i=0; i<[ImagesArr count]; i++) {
//        UIImageView *imgv = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth * (i + 1), 0, ScreenWidth, self.mj_h)];
//        NSDictionary *dic_sc =[ImagesArr objectAtIndex:i];
//        
//        NSString *path1=self.ImageArr
//        NSURL *url=[NSURL URLWithString:path1];
//        
//        [imgv setImageWithURL:url];
//        [scrollView addSubview:imgv];
//        
//    }
//    UIImageView *firstImgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.mj_h)];
////    NSString *path=[NSString stringWithFormat:@"%@%@",IMGVIEW_URL,[[_list objectAtIndex:_list.count -1] objectForKey:@"AdRegularPath"]];
//    
////    NSURL *url=[NSURL URLWithString:path];
////    [firstImgv setImageWithURL:url];
//    [scrollView addSubview:firstImgv];
//    
//    UIImageView *lastImgv = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth * (ImagesArr.count + 1), 0, ScreenWidth, self.mj_h)];
////    NSString *path1=[NSString stringWithFormat:@"%@%@",IMGVIEW_URL,[[_list objectAtIndex:0] objectForKey:@"AdRegularPath"]];
//    
////    NSURL *url1=[NSURL URLWithString:path1];
////    [lastImgv setImageWithURL:url1];
//    [scrollView addSubview:lastImgv];
//}
//
//#pragma mark --轮播图片的代理方法
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    int svw=ScreenWidth;
//    CGPoint point=scrollView.contentOffset;
//    if ((int)point.x/svw==0) {
//        [scrollView setContentOffset:CGPointMake(svw *_imgsArr.count, 0)];
//    }else if ((int)point.x /svw ==_imgsArr.count + 1){
//        [scrollView setContentOffset:CGPointMake(svw, 0)];
//    }
//}
//-(void)pageClick:(UIPageControl *)sender{
//    NSInteger index = sender.currentPage;
//    [UIView beginAnimations:Nil context:nil];
//    self.scroView.contentOffset = CGPointMake(index*ScreenWidth, 0.0);
//    [UIView commitAnimations];
//}
//
//#pragma UIScrollViewDelegate 协议
//
////滚动视图正在滚动中
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    
//    //得到滚动视图内容的偏移量
//    CGPoint point = scrollView.contentOffset;
//    
//    NSInteger index = point.x / ScreenWidth;
//    
//    //NSLog(@"index:%li",(long)index);
//    self.pageControl.currentPage = index-1;
//}
//
//-(void)imgvScroll{
//    [UIView animateWithDuration:0.8 animations:^{
//        float imgvScroX = _scroView.contentOffset.x;
//        float recentScroX = imgvScroX + ScreenWidth;
//        
//        _scroView.contentOffset = CGPointMake(recentScroX, 0);
//    }];
//    int svW = ScreenWidth;
//    CGPoint point = _scroView.contentOffset;
//    if ((int)point.x / svW  == 0) {
//        [_scroView setContentOffset:CGPointMake(svW *_imgsArr.count, 0)];
//    }
//    if ((int)point.x / svW  == _imgsArr.count + 1) {
//        [_scroView setContentOffset:CGPointMake(svW, 0)];
//    }
//    
//}
@end
