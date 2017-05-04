//
//  WKWebViewController.m
//  WKKit
//
//  Created by 王宇 on 2016/10/21.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKWebViewController.h"

@interface WKWebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.webView loadHTMLString:@"http://taosheh5.qiluzhaoshang.com/Discover/DiscoverLady?discoverId=1&userInfoId=1111" baseURL:nil];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://taosheh5.qiluzhaoshang.com/Discover/DiscoverLady?discoverId=1&userInfoId=1111"]]];
    // Do any additional setup after loading the view from its nib.
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
