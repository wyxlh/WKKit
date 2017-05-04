//
//  WKAutlaoutViewController.m
//  WKKit
//
//  Created by 王宇 on 2016/10/13.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKAutlaoutViewController.h"
#import "UILabel+YBAttributeTextTapAction.h"
#define YBAlertShow(messageText,buttonName) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:(messageText) \
delegate:nil cancelButtonTitle:(buttonName) otherButtonTitles: nil];\
[alert show];
@interface WKAutlaoutViewController ()<YBAttributeTapActionDelegate>
@property (weak, nonatomic) IBOutlet UIButton *remove;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UILabel *lbl;
- (IBAction)clickremove:(id)sender;
@end

@implementation WKAutlaoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"约束优先级";
    NSString *label_text1 = _lbl.text;
    NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc]initWithString:label_text1];
    [attributedString1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, label_text1.length)];
    [attributedString1 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, 2)];
    [attributedString1 addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(8, 2)];
    _lbl.backgroundColor = [UIColor yellowColor];
    _lbl.numberOfLines = 2;
    _lbl.attributedText = attributedString1;
    [self.view addSubview:_lbl];
    
    [_lbl yb_addAttributeTapActionWithStrings:@[@"妈卖批"] delegate:self];

}
//delegate
- (void)yb_attributeTapReturnString:(NSString *)string range:(NSRange)range index:(NSInteger)index
{
    NSString *message = [NSString stringWithFormat:@"点击了“%@”字符\nrange: %@\nindex: %ld",string,NSStringFromRange(range),index];
    YBAlertShow(message, @"取消");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)clickremove:(id)sender {
    [self.view2 removeFromSuperview];
}
@end
