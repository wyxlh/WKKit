//
//  WKUserCenterViewController.m
//  WKKit
//
//  Created by 王宇 on 16/9/13.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKUserCenterViewController.h"

@interface WKUserCenterViewController ()

@end

@implementation WKUserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的";
    
    UITextView *textView=[[UITextView alloc]initWithFrame:CGRectMake(30, 100, 200, 30)];
    textView.layer.masksToBounds=YES;
    textView.layer.borderWidth=0.5;
    textView.text=@"我的宝宝";
    textView.font=[UIFont  systemFontOfSize:17];
    textView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    [self.view addSubview:textView];
    
    UILabel *placeHolder=[[UILabel alloc]init];
//    placeHolder.text=@"请输入......";
    placeHolder.textColor=[UIColor lightGrayColor];
    [placeHolder sizeToFit];
    [textView addSubview:placeHolder];
    
    textView.font=[UIFont systemFontOfSize:13];
    placeHolder.font=[UIFont systemFontOfSize:13];
    [textView setValue:placeHolder forKey:@"_placeholderLabel"];
    
    NSArray *familyNames =[[NSArray alloc]initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    NSInteger indFamily, indFont;
    NSLog(@"[familyNames count]===%lu",(unsigned long)[familyNames count]);
    for(indFamily=0;indFamily<[familyNames count];++indFamily)
        
    {
        NSLog(@"Family name: %@", [familyNames objectAtIndex:indFamily]);
        fontNames =[[NSArray alloc]initWithArray:[UIFont fontNamesForFamilyName:[familyNames objectAtIndex:indFamily]]];
        
        for(indFont=0; indFont<[fontNames count]; ++indFont)
            
        {
            NSLog(@"Font name: %@",[fontNames objectAtIndex:indFont]);
            
        }
        
    }
    
    
    
    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(100, 300, 200, 40)];
    lable.text=@"汉体";
    lable.font = [UIFont fontWithName:@"EuphemiaUCAS-Bold" size:50.0];
    [self.view addSubview:lable];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}


@end
