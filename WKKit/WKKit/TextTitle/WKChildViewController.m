//
//  WKChildViewController.m
//  WKKit
//
//  Created by 王宇 on 16/9/27.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKChildViewController.h"

@interface WKChildViewController ()

@end

@implementation WKChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    self.view.backgroundColor=CustomColor(R, G, B, 1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
