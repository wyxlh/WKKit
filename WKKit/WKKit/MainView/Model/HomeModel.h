//
//  HomeModel.h
//  WKKit
//
//  Created by 王宇 on 16/9/20.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKBaseModel.h"

@interface HomeModel : NSObject
@property (nonatomic,strong)NSArray *promotionList;
@end

@interface BannerModel : NSObject
@property (nonatomic,strong)NSString *pageurl;
@property (nonatomic,strong)NSString *proId;
@property (nonatomic,strong)NSString *proUrl;
@property (nonatomic,strong)NSString *promotionInfo;
@property (nonatomic,strong)NSString *promotionType;
@property (nonatomic,strong)NSString *shareContent;
@property (nonatomic,strong)NSString *shareImageUrl;
@property (nonatomic,strong)NSString *shareUrl;
@property (nonatomic,strong)NSString *title;
@property (nonatomic,strong)NSString *usepage;
@end
/**
 * 
 {
 pageurl = "http://m.tommy.com.cn/index.php/tommygigi/now";
 proId = 63;
 proUrl = "http://www.tommyapp.com.cn/admin/pic/pro_banner/1473407437155080548.jpg";
 promotionInfo = "";
 promotionType = 0;
 shareContent = "Gigi Hadid\U5411\U6211\U5c55\U793a\U4e86#TOMMYXGIGI#\U7cfb\U5217\U9996\U53d1\U642d\U914d\U7167\U7247\U3002\U4e0d\U5982\U4f60\U4e5f\U5feb\U6765\U5206\U4eab\U4e00\U4e0b\U4f60\U559c\U6b22\U7684\U5355\U54c1\U3002";
 shareImageUrl = "http://www.tommyapp.com.cn/admin/pic/share/1472095578816360748.jpg";
 shareUrl = "http://m.tommy.com.cn/index.php/tommygigi/now";
 title = Gigi;
 usepage = 1;
 },
 */
