//
//  WKClassViewController.m
//  WKKit
//
//  Created by 王宇 on 16/9/13.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKClassViewController.h"
#import "LZBFlowLayout.h"
#import "WKCollectionViewCell.h"
#import "CSIIinfiniteScroller.h"
@interface WKClassViewController ()<CSIIScrollerViewDelegates>{
    NSString *_endTimel;
}
@property (nonatomic,strong) NSArray *titleArr;
@end

@implementation WKClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"商品";
//  self.titleArr=@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20"];
//    
//    
//    NSMutableArray *array=[NSMutableArray arrayWithArray:self.titleArr];
//    
   
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSMutableArray *array=[NSMutableArray new];
    
    for (int i=1960; i<=2000; i++) {
        [array addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    NSInteger Index;
    
    for(int i=0;i<array.count;i++){
        
        NSString *str = array[i];
        
        if ([str isEqualToString:@"2000"]) {
            
            Index = i;
            break;
        }
    }
    
    if (Index==1) {
        Index=array.count-1;
    }else if (Index==0){
        Index=array.count-2;
    }else{
        Index -=2;
    }
    
    CSIIinfiniteScroller *scr=[[CSIIinfiniteScroller alloc]initWithFrame:CGRectMake(50, 300, ScreenWidth-100, 30) dataSourceWith:array speedWith:2.0 withItemSize:30 selectItme:Index];
    scr.delegates=self;
    [self.view addSubview:scr];
}


- (void)didSelectImageAtIndexPathItem:(NSInteger)indexPathItem{
    DLog(@"%ld",indexPathItem);
    DLog(@"________%@",self.titleArr[indexPathItem]);
}

@end
