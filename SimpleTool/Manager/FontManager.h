//
//  FontManager.h
//  SimpleTool
//
//  Created by PXJ on 2017/11/6.
//  Copyright © 2017年 com. All rights reserved.
//

#define KFont [FontManager sharedFont]

#import <Foundation/Foundation.h>

@interface FontManager : NSObject
@property (nonatomic,strong)UIFont * navTitleText;

@property (nonatomic,strong)UIFont * textS;

@property (nonatomic,strong)UIFont * textM;

@property (nonatomic,strong)UIFont * textL;

+(FontManager*)sharedFont;

@end
