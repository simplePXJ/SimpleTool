//
//  NavView.m
//  SimpleTool
//
//  Created by PXJ on 2017/10/16.
//  Copyright © 2017年 com. All rights reserved.
//
#define leftClick_Tag 900
#define rightClick_Tag 901

#import "NavView.h"

@implementation NavView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, KScreenWidth, KNavBarHeight);
        [self initUI];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame;
{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    self.clipsToBounds = YES;
    self.frame = CGRectMake(0, 0, KScreenWidth, KNavHeight);
    self.backgroundColor = KColor.navBarBack;
    self.titleLab   = [[UILabel alloc] initWithFrame:CGRectMake(50, KStatusBarHeight, KScreenWidth-100, KNavBarHeight)];
    self.titleLab.textColor = KColor.navTitleText;
    self.titleLab.font      = KFont.navTitleText;
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    self.titleLab.adjustsFontSizeToFitWidth = YES;
    self.titleLab.userInteractionEnabled    = YES;
    [self  addSubview:self.titleLab];
    
    self.leftImg = [[UIImageView alloc] init];
    self.leftImg.center = CGPointMake(20, 42);
    self.leftImg.image = [UIImage imageNamed:@"return_1"];
    self.leftImg.bounds = CGRectMake(0, 0,15, 15);
    [self addSubview:self.leftImg];
    
    self.leftControl = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftControl.tag = leftClick_Tag;
    self.leftControl.frame = CGRectMake(0, 20, 54, 44);
    [self.leftControl.titleLabel setFont:KFont.textM];
    [self addSubview:self.leftControl];
    
    self.rightLab = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth-95, 30, 85, 24)];
    self.rightLab.font = KFont.textM;
    self.rightLab.textAlignment = NSTextAlignmentRight;
    self.rightLab.textColor = KColor.navTitleText;
    [self addSubview:self.rightLab];
    
    self.rightImg = [[UIImageView alloc] initWithFrame:CGRectMake(KScreenWidth-85, 30, 75, 24)];
    [self addSubview:self.rightImg];
    
    self.rightControl = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightControl.tag = rightClick_Tag;
    self.rightControl.frame = CGRectMake(KScreenWidth-84, 20, 84, 44);
    [self.rightControl.titleLabel setFont:KFont.textM];
    [self addSubview:self.rightControl];
    NSDate * nowDate = [SPDateManager sharedInstance].nowDate;
    NSLog(@"%@",nowDate);
    
    NSDateFormatter * formatter = [SPDateManager sharedInstance].dateFormatter;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
}
-(void)hiddenleft;
{
    
    self.leftImg.hidden = YES;
    
}

- (void)setTitle:(NSString *)title
{
    self.titleLab.text = title;
}
@end
