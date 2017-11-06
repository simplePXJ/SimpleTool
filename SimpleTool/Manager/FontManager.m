//
//  FontManager.m
//  SimpleTool
//
//  Created by PXJ on 2017/11/6.
//  Copyright © 2017年 com. All rights reserved.
//

#import "FontManager.h"

@implementation FontManager

+(FontManager*)sharedFont
{
    static dispatch_once_t once;
    static FontManager * fontManager;
    dispatch_once(&once, ^{
        fontManager = [[FontManager alloc] init];
        [fontManager defaultFontStyle];
    });
    return fontManager;
}

- (void)defaultFontStyle{
    
    self.navTitleText = SYSTEMFONT(16);
    self.textL      = SYSTEMFONT(16);
    self.textM      = SYSTEMFONT(13);
    self.textS      = SYSTEMFONT(10);
}

@end
