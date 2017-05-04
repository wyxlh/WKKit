//
//  WKSunOrderModel.h
//  WKKit
//
//  Created by 王宇 on 16/9/14.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKBaseModel.h"

@interface WKSunOrderModel : WKBaseModel
@property (nonatomic,readonly)NSString *totalCount;
@property (nonatomic,readonly)NSArray *displayList;


@end

@interface WKSunDetailModel : WKBaseModel
@property (nonatomic,strong)NSDictionary *admire;
@property (nonatomic,strong)NSString *content;
@property (nonatomic,strong)NSString *displayId;
@property (nonatomic,strong)NSString *esort;
@property (nonatomic,strong)NSString *userId;
@property (nonatomic,strong)NSArray *admireList;
@property (nonatomic,strong)NSArray *imgs;
@property (nonatomic,strong)NSDictionary *userinfo;
@end