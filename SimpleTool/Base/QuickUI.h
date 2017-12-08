//
//  QuickUI.h
//  SimpleTool
//
//  Created by PXJ on 2017/11/28.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuickUI : NSObject

+ (UIView *)newViewWithFrame:(CGRect)frame
                    bgColor:(UIColor *)bgColor;

+ (UILabel *)newLabelWithFrame:(CGRect)frame
                      bgColor:(UIColor *)bgColor
                         text:(NSString *)text
                    textColor:(UIColor *)textColor
                textAlignment:(NSTextAlignment)textAlignMent
                         font:(UIFont *)font;

+ (UIButton *)newButtonWithFrame:(CGRect)frame
                         bgColor:(UIColor *)bgColor
                           title:(NSString *)title
                      titleColor:(UIColor *)titleColor
                       titleFont:(UIFont *)titleFont;
+ (UIImageView *)newImageViewWithFrame:(CGRect)frame
                                 image:(UIImage *)image;








@end
