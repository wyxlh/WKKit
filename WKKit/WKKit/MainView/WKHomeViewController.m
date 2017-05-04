
//
//  WKHomeViewController.m
//  WKKit
//
//  Created by 王宇 on 16/9/13.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKHomeViewController.h"
#import "HomeModel.h"
#import "HomeBannerTableViewCell.h"
@interface WKHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)HomeModel *model;
@property (nonatomic,strong)BannerModel *bannerModel;
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation WKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"首页";
    [self makeUI];
    [self requestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, NavHeight, ScreenWidth, ScreenHeight-NavHeight) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.separatorStyle=0;
        [_tableView registerNib:[UINib nibWithNibName:@"HomeBannerTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeCell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
#pragma mark 首页数据获取
-(void)requestData{
    NSString *homeUrl = @"/home/index";
    [self startLoading];
    WS(weakSelf)
    [WKRequest getWithURLString:homeUrl parameters:nil success:^(WKBaseModel *baseModel) {
        [weakSelf stopLoading];
        weakSelf.model=[HomeModel mj_objectWithKeyValues:baseModel.mDictionary];
        DLog(@"%@",weakSelf.model.promotionList);
//        [weakSelf.tableView reloadData];
       
    } failure:^(NSError *errer) {
         [weakSelf stopLoading];
    }];

}

-(void)makeUI{
    NSMutableArray *images=[NSMutableArray new];
    for (int i=1; i<51; i++) {
        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"魔石宝宝-大绿00%d",i]]];
    }
    
    UIImageView *ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(50, 100, 200, 200)];
    ImgView.image=[UIImage imageNamed:@"魔石宝宝-大绿001"];
    ImgView.animationImages=images;
    ImgView.animationDuration=2;
    ImgView.tag=10;
    ImgView.animationRepeatCount=1;
    ImgView.userInteractionEnabled=YES;
    UITapGestureRecognizer *gesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickImage) ];
    [ImgView addGestureRecognizer:gesture];
    [self.view addSubview:ImgView];
}
-(void)clickImage{
    UIImageView *img=[self.view viewWithTag:10];
    [img startAnimating];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        static NSString *CellWithIdentifier=@"HomeCell";
        HomeBannerTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellWithIdentifier forIndexPath:indexPath];
        cell.model=self.model;
        return cell;
    }else{
        return nil;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 540/750.0*ScreenWidth;
    }
    return 0;
}


@end
