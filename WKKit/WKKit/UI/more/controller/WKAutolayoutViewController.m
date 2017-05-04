//
//  WKAutolayoutViewController.m
//  WKKit
//
//  Created by 王宇 on 2016/10/15.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKAutolayoutViewController.h"
#import "OneTableViewCell.h"
#import "ThreeTableViewCell.h"
#import "FourTableViewCell.h"
#import "LayoutTableViewCell.h"
#import "HSGifHeader.h"
@interface WKAutolayoutViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSInteger currentPage;
}
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation WKAutolayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    currentPage=1;
    self.title=@"表格Cell自适应";
    [self netRequest:NO];
    [self.tableView reloadData];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, NavHeight, ScreenWidth, ScreenHeight-NavHeight) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.separatorStyle=0;
        _tableView.estimatedRowHeight=100;
//        [_tableView registerNib:[UINib nibWithNibName:@"OneTableViewCell" bundle:nil] forCellReuseIdentifier:@"oneCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"ThreeTableViewCell" bundle:nil] forCellReuseIdentifier:@"threeCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"FourTableViewCell" bundle:nil] forCellReuseIdentifier:@"fourCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"LayoutTableViewCell" bundle:nil] forCellReuseIdentifier:@"layoutCell"];
//        MJRefreshGifHeader *gifHeader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
//            currentPage = 1;
//            [self netRequest:YES];
//        }];
        self.tableView.mj_header = [HSGifHeader headerWithRefreshingBlock:^{
            [self netRequest:YES];
        }];
//        NSMutableArray *imgArray = [NSMutableArray new];
//        for (int i = 33; i <234; i++) {
//            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"下拉_%zd", i]];
//            [imgArray addObject:image];
//        }
//        DLog(@"%@",imgArray);
//        gifHeader.stateLabel.hidden = YES;
//        gifHeader.lastUpdatedTimeLabel.hidden = YES;
//        
//        [gifHeader setImages:@[imgArray[0]] forState:MJRefreshStateIdle];
//        [gifHeader setImages:imgArray forState:MJRefreshStateRefreshing];
//        _tableView.mj_header = gifHeader;
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0){
        ThreeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"threeCell" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row==1){
        FourTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"fourCell" forIndexPath:indexPath];
        return cell;
    }else{
        LayoutTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"layoutCell" forIndexPath:indexPath];
        return cell;
    }
}

-(void)netRequest:(BOOL)isRefresh{
    if (isRefresh) {
        DLog(@"refresh");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView.mj_header endRefreshing];
        });
        
    }else{
        DLog(@"nomal");
    }
}


@end
