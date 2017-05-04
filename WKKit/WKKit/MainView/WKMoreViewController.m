//
//  WKMoreViewController.m
//  WKKit
//
//  Created by 王宇 on 16/9/13.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKMoreViewController.h"
#import "MoreTableViewCell.h"
#import "MoreHightTableViewCell.h"
#import "WKSunOrderViewController.h"
#import "TitleViewViewController.h"
#import "WKAutlaoutViewController.h"
#import "WKAutolayoutViewController.h"
#import "WKHelpViewController.h"
#import "WKWebViewController.h"
#import "QRCodeViewController.h"
@interface WKMoreViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *titleArr;
}
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation WKMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"更多";
    titleArr=@[@"晒单分享",@"专柜店铺",@"品牌故事",@"邮件订阅",@"帮助",@"关于",@"接收系统消息",@"清空图片缓存"];
    [self.tableView reloadData];
    // Do any additional setup after loading the view.
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, NavHeight, ScreenWidth, ScreenHeight-NavHeight) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.separatorStyle=0;
        [_tableView registerNib:[UINib nibWithNibName:@"MoreTableViewCell" bundle:nil] forCellReuseIdentifier:@"moreCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"MoreHightTableViewCell" bundle:nil] forCellReuseIdentifier:@"hCell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

#pragma mark UITableViewDelegate,UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return titleArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellWithIdentifier=@"moreCell";
    static NSString *HCellWithIdentifier=@"hCell";
    if (indexPath.row==6) {
        MoreHightTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:HCellWithIdentifier forIndexPath:indexPath];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        MoreTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellWithIdentifier forIndexPath:indexPath];
        cell.title.text=titleArr[indexPath.row];
        return cell;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (6==indexPath.row)?113:44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //晒单
    if (indexPath.row==0) {
        WKSunOrderViewController *sun=[[WKSunOrderViewController alloc]init];
        sun.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:sun animated:YES];
    }else if (indexPath.row==1){
        TitleViewViewController *titl=[[TitleViewViewController alloc]init];
        titl.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:titl animated:YES];
    }else if (indexPath.row==2){
        WKAutlaoutViewController *titl=[[WKAutlaoutViewController alloc]init];
        titl.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:titl animated:YES];
    }else if (indexPath.row==3){
        WKAutolayoutViewController *titl=[[WKAutolayoutViewController alloc]init];
        titl.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:titl animated:YES];
    }else if (indexPath.row==4){
        WKHelpViewController *help=[[WKHelpViewController alloc]init];
        help.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:help animated:YES];
    }else if (indexPath.row==5){
        WKWebViewController *web=[[WKWebViewController alloc]initWithNibName:@"WKWebViewController" bundle:nil];
        web.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:web animated:YES];
    }else if (indexPath.row==7){
        QRCodeViewController *qr=[QRCodeViewController new];
        qr.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:qr animated:YES];
    }
}



#pragma mark  判断系统的推送开关是关闭还是打开
- (BOOL)canReseavePushNotification
{
    BOOL isReseave = YES;
    if (iOS_V(8)) {
        
        return [[UIApplication sharedApplication] isRegisteredForRemoteNotifications];
    }else {
        if ([[UIApplication sharedApplication] isRegisteredForRemoteNotifications] == UIUserNotificationTypeNone) {
            isReseave = NO;
        }
    }
    return isReseave;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
