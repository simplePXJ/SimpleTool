//
//  AdScrollView.m
//  SimpleTool
//
//  Created by PXJ on 2017/11/13.
//  Copyright © 2017年 com. All rights reserved.
//

#import "AdScrollView.h"
#import "AdScrollSubView.h"

@implementation AdScrollView
{
    AdScrollSubView * _adScrollSubView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI{
    NSArray * array = @[];
    self.backgroundColor = KColor.view_main_2;
    [self setAdArray:array];
}
- (void)setAdArray:(NSArray *)array
{
    
    if (_adScrollSubView!=nil) {
        [_adScrollSubView removeFromSuperview];
        _adScrollSubView = nil;
    }
    _adScrollSubView                  = [[AdScrollSubView alloc]initWithTitles:array];
    _adScrollSubView.frame            = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    _adScrollSubView.textAlignment    = NSTextAlignmentCenter;//默认
    _adScrollSubView.isHaveTouchEvent = NO;
    _adScrollSubView.labelFont        = KFont.textM;
    _adScrollSubView.color            = KColor.Text_main;
    _adScrollSubView.time             = 3.0f;
    _adScrollSubView.defaultMargin    = 10;
    _adScrollSubView.numberOfTextLines = 1;
    _adScrollSubView.edgeInsets       = UIEdgeInsetsMake(8, 8,8, 10);
    _adScrollSubView.clickAdBlock = ^(NSUInteger index){
        
    };
    [self addSubview:_adScrollSubView];
    [_adScrollSubView beginScroll];
    
}
@end
