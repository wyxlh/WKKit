//
//  WKShoppingCartViewController.m
//  WKKit
//
//  Created by 王宇 on 16/9/13.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKShoppingCartViewController.h"
#import "WKShopTableViewCell.h"
#import <LBXScanViewController.h>
#import "SubLBXScanViewController.h"
@interface WKShoppingCartViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *titleArr;
@end

@implementation WKShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"购物车";
    self.titleArr=@[@"扫描二维码",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    [self.tableView reloadData];
}


-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, NavHeight, ScreenWidth, ScreenWidth) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.separatorStyle=0;
        _tableView.rowHeight=50;
        [_tableView registerNib:[UINib nibWithNibName:@"WKShopTableViewCell" bundle:nil] forCellReuseIdentifier:@"WKShopTableViewCell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WKShopTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"WKShopTableViewCell" forIndexPath:indexPath];
    cell.title.text=self.titleArr[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==0) {
        SubLBXScanViewController *vc = [SubLBXScanViewController new];
        vc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
