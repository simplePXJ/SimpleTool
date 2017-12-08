//
//  QuickUI.m
//  SimpleTool
//
//  Created by PXJ on 2017/11/28.
//  Copyright © 2017年 com. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "QuickUI.h"

@implementation QuickUI


+ (UIView *)newViewWithFrame:(CGRect)frame
                     bgColor:(UIColor *)bgColor;
{
    UIView * view = [[UIView alloc] init];
    view.frame = frame;
    view.backgroundColor = bgColor==nil?[UIColor clearColor]:bgColor;
    return view;
}

+ (UILabel *)newLabelWithFrame:(CGRect)frame
                       bgColor:(UIColor *)bgColor
                          text:(NSString *)text
                     textColor:(UIColor *)textColor
                 textAlignment:(NSTextAlignment )textAlignMent
                          font:(UIFont *)font;
{
    UILabel * label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor   = bgColor==nil?[UIColor clearColor]:bgColor;
    label.text              = text;
    label.textColor         = textColor;
    label.textAlignment     = textAlignMent;
    label.font              = font;
    return label;
}

+ (UIButton *)newButtonWithFrame:(CGRect)frame
                         bgColor:(UIColor *)bgColor
                           title:(NSString *)title
                      titleColor:(UIColor *)titleColor
                       titleFont:(UIFont *)titleFont;
{
    UIButton * button   = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundColor:bgColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button.titleLabel setFont:titleFont];
    return button;
}
+ (UIImageView *)newImageViewWithFrame:(CGRect)frame
                                 image:(UIImage *)image;
{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView.image         = image;
    return imageView;
}



@end
