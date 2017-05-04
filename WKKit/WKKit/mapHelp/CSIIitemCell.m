//
//  CSIIitemCell.m
//  wuxiangongdong
//
//  Created by 孙启鹏 on 16/10/13.
//  Copyright © 2016年 孙启鹏. All rights reserved.
//

#import "CSIIitemCell.h"
#define CSIIColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
@interface CSIIitemCell ()

@property(nonatomic, weak) UILabel *icon;
//@property(nonatomic, weak) UIWebView *icon;
@end

@implementation CSIIitemCell


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *im = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        im.textAlignment = NSTextAlignmentCenter;
        im.font=[UIFont systemFontOfSize:10];
        [self.contentView addSubview:im];
        
        self.icon = im;
    }
    return self;
}

-(void)setModel:(CSIIitemModel *)model
{
    _model = model;
    self.icon.text = _model.time;
}
-(void)setSelected:(BOOL)selected{
    
    if (selected) {
        _icon.textColor=[UIColor redColor];
        
    }else{
        _icon.textColor=[UIColor blackColor];
    }
}
-(void)setBackColor:(UIColor *)backColor
{
    _backColor = backColor;
    self.icon.textColor = _backColor;
}
@end
