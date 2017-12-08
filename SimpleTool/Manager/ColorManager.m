//
//  ColorManager.m
//  SimpleTool
//
//  Created by PXJ on 2017/10/13.
//  Copyright © 2017年 com. All rights reserved.
//

#import "ColorManager.h"

@implementation ColorManager

+(ColorManager*)sharedColor
{
    static dispatch_once_t once;
    static ColorManager * colorManager;
    dispatch_once(&once, ^{
        colorManager = [[ColorManager alloc] init];
        [colorManager defaultColorStyle];
    });
    return colorManager;
}

- (void)defaultColorStyle{
    
    self.backGround   = RGBCOLOR(247, 247, 247);
    self.navBarBack   = RGBCOLOR(212, 69, 13);
    self.tabbarBack   = RGBCOLOR(230, 230, 230);
    self.seperateLine = RGBCOLOR(200, 200, 200);
    self.view_main    = RGBCOLOR(212, 69, 13);
    self.view_main_2  = RGBCOLOR(211, 124, 124);
    self.navTitleText = RGBCOLOR(255, 255, 255);
    self.Text_main    = RGBCOLOR(38, 37, 42);
    self.Text_main_2  = RGBCOLOR(110, 110, 110);
    self.candleView   = RGBCOLOR(253, 253, 253);
    self.candleRed    = RGBCOLOR(250, 130, 130);
    self.candleGreen  = RGBCOLOR(130, 250, 130);
}
- (void)changeColorWithStyle:(NSInteger)colorStyle
{
    
}
@end
