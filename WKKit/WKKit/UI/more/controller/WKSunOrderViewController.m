//
//  WKSunOrderViewController.m
//  WKKit
//
//  Created by 王宇 on 16/9/14.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKSunOrderViewController.h"
#import "WKSunOrderModel.h"
//#import "LQPhotoPickerViewController.h"
//#import "WKAlbumViewController.h"
//#import "WKAlbumChildViewController.h"
//#import "LQImgPickerActionSheet.h"
@interface WKSunOrderViewController ()
{
    NSInteger pageIndex_all,pageIndex_my;

    
}
@property (nonatomic,strong)NSArray *array;
@property (nonatomic,strong)WKSunOrderModel *sunModel;
//@property (nonatomic,strong) WKAlbumChildViewController *PhotoPickerView;

@end

@implementation WKSunOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"晒单分享";
     pageIndex_all=pageIndex_my=1;
    [self addrightButton:@"相册"];
    [self requestData];
    
    
}

-(void)rightButtonClick:(id)sender{
    DLog(@"sss");
//     [self StopHudLoaing];

}

-(void)requestData{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000;
    NSString *timeString1 = [NSString stringWithFormat:@"%.f", a];
    NSString *Value=@"123654@!53";
    NSString *md5=[NSString stringWithFormat:@"%@%@%@",Value,@"",timeString1];
    NSString *accounturl = @"display/getAll";
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"", @"userId",timeString1,@"timestamp",[NSString MD5NSString:md5],@"sign",@"20",@"pageSize",[NSString stringWithFormat:@"%ld",(long)pageIndex_all],@"pageIndex", nil];
//    [self startHudLoading];
    WS(weakSelf)
    [WKRequest postWithURLString:accounturl parameters:params success:^(WKBaseModel *model) {
        weakSelf.sunModel=[WKSunOrderModel mj_objectWithKeyValues:model.mDictionary];
       
        _array=weakSelf.sunModel.displayList;
        
    } failure:^(NSError *errer) {
//       [weakSelf StopHudLoaing];
    }];
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
