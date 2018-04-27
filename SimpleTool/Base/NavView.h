//
//  NavView.h
//  SimpleTool
//
//  Created by PXJ on 2017/10/16.
//  Copyright © 2017年 com. All rights reserved.
//
typedef void(^ClickBlock)(int);
#import <UIKit/UIKit.h>

@interface NavView : UIView

@property (nonatomic,strong)ClickBlock clickBlock;
@property (nonatomic,strong)UIView * backView;
@property (nonatomic,strong)UIImageView * leftImg;
@property (nonatomic,strong)UIImageView * rightImg;
@property (nonatomic,strong)UIButton * leftControl;
@property (nonatomic,strong)UIButton * rightControl;
@property (nonatomic,strong)UILabel * titleLab;
@property (nonatomic,strong)UIView * SPSuperView;
@property (nonatomic,strong)UILabel * rightLab;

- (id)initWithSupView:(UIView*)supView;
- (void)loadUI;
-(void)setTitle:(NSString *)title;
-(void)hiddenleft;

@end
