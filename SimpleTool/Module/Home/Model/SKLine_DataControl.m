//
//  SKLine_DataControl.m
//  SimpleTool
//
//  Created by PXJ on 2017/12/5.
//  Copyright © 2017年 com. All rights reserved.
//

#import "SKLine_DataControl.h"

@implementation SKLine_DataControl

+(SKLine_DataControl *)shared;
{
    static  SKLine_DataControl *dataControl = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataControl = [[self alloc]init];
        dataControl.showCandleNum = KLine_Control_Num;
        dataControl.showLineNum = 6;
        dataControl.klineType = KLineMinute_1;
        dataControl.revealType = RevealTypeLineDiagram;
        dataControl.floatNum = 2;
        dataControl.pinchCountWithCandle = 1440;
        dataControl.pinchCountWithTimeSharing = 1440;
    });
    return dataControl;
}

@end
