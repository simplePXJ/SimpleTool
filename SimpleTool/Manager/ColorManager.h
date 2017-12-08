//
//  ColorManager.h
//  SimpleTool
//
//  Created by PXJ on 2017/10/13.
//  Copyright © 2017年 com. All rights reserved.
//
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define KColor [ColorManager sharedColor]

#import <Foundation/Foundation.h>

@interface ColorManager : NSObject

@property (nonatomic,strong)UIColor * backGround;

@property (nonatomic,strong)UIColor * navBarBack;

@property (nonatomic,strong)UIColor * tabbarBack;

@property (nonatomic,strong)UIColor * seperateLine;

@property (nonatomic,strong)UIColor * view_main;

@property (nonatomic,strong)UIColor * view_main_2;

@property (nonatomic,strong)UIColor * navTitleText;

@property (nonatomic,strong)UIColor * Text_main;

@property (nonatomic,strong)UIColor * Text_main_2;


@property (nonatomic,strong)UIColor * candleView;
@property (nonatomic,strong)UIColor * candleRed;
@property (nonatomic,strong)UIColor * candleGreen;



+(ColorManager*)sharedColor;

@end

