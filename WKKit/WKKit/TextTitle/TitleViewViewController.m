//
//  TitleViewViewController.m
//  WKKit
//
//  Created by 王宇 on 16/9/27.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "TitleViewViewController.h"
#import "TitleScrollView.h"
#import "WKChildViewController.h"
@interface TitleViewViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)TitleScrollView *titleView;
@property (nonatomic,strong)UIScrollView *scrollView;
@end

@implementation TitleViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"嘻嘻嘻";
    [self addChildViewControllers];
    self.scrollView.contentOffset = CGPointMake(0 * ScreenWidth, 0);
    [self scrollViewDidEndScrollingAnimation:self.scrollView];
    
}

#pragma mark 懒加载
-(TitleScrollView *)titleView{
    if (!_titleView) {
        WS(weakSelf)
        _titleView=[[TitleScrollView alloc]initWithFrame:CGRectMake(0, NavHeight, ScreenWidth, 25) TitleArray:@[@"嘻嘻",@"嘻嘻",@"嘻嘻",@"嘻嘻"] selectedIndex:0 scrollEnable:NO lineEqualWidth:YES selectColor:SKOrangeColor defaultColor:[UIColor blackColor] SelectBlock:^(NSInteger index) {
            [weakSelf.scrollView setContentOffset:CGPointMake(ScreenWidth*index, 0) animated:YES];
        }];

        
        self.titleView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_titleView];
    }
    return _titleView;
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, self.titleView.maxY+5, ScreenWidth, ScreenHeight-self.titleView.maxY+5)];
        _scrollView.delegate=self;
        _scrollView.pagingEnabled=YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.bounces = NO;
        _scrollView.contentSize=CGSizeMake(ScreenWidth*4, ScreenHeight-self.titleView.maxY+5);
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/ScreenWidth;
    [self.titleView setSelectedIndex:index];
    [self scrollViewDidEndScrollingAnimation:scrollView];
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/ScreenWidth;
    WKChildViewController *childVC =self.childViewControllers[index];
    childVC.view.x = scrollView.contentOffset.x;
    childVC.view.y = 0;//设置控制器的y值为0(默认为20)
    childVC.view.height = scrollView.height;//设置控制器的view的height值为整个屏幕的高度（默认是比屏幕少20）
//    [childVC refresh];
    [scrollView addSubview:childVC.view];
    
}



-(void)addChildViewControllers{
    for (int i = 0; i < 4; i++) {
        WKChildViewController *child = [[WKChildViewController alloc]init];
        child.index = i;
        [self addChildViewController:child];
    }
}



@end
