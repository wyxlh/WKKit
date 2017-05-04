//
//  TYDotIndicatorView.h
//  TYDotIndicator
//
//  Created by 润泰－技术部 on 16/9/17.
//  Copyright © 2016年 ruitaiLong. All rights reserved.
//
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TYDotIndicatorViewStyle)
{
    TYDotIndicatorViewStyleSquare,
    TYDotIndicatorViewStyleRound,
    TYDotIndicatorViewStyleCircle
};

@interface TYDotIndicatorView : UIView

@property (nonatomic, assign) BOOL hidesWhenStopped;

- (id)initWithFrame:(CGRect)frame
           dotStyle:(TYDotIndicatorViewStyle)style
           dotColor:(UIColor *)dotColor
            dotSize:(CGSize)dotSize;

- (void)startAnimating;
- (void)stopAnimating;
- (BOOL)isAnimating;


@end
