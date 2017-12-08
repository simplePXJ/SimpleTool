//
//  SKLine_Configer.h
//  SimpleTool
//
//  Created by PXJ on 2017/12/5.
//  Copyright © 2017年 com. All rights reserved.
//

#ifndef SKLine_Configer_h
#define SKLine_Configer_h

#import "SKLine_DataNet.h"
#import "SKLine_DataModel.h"
#import "SKLine_DataManager.h"
#import "SKLine_GesManager.h"
#import "SKLine_Coordinate.h"
#import "SKLine_DataControl.h"


typedef NS_ENUM(NSInteger,RevealType) {
    /**
     *  闪电图
     */
    RevealTypeLightning = 1,
    /**
     *  分时图
     */
    RevealTypeLineDiagram = 10,
    /**
     *  蜡烛图
     */
    RevealTypeCandleDiagram = 20
};

typedef NS_ENUM(NSInteger,Direction) {
    DirectionLeft = 0,
    DirectionRight = 1
};

typedef NS_ENUM(NSInteger,KLineTime) {
    KLineMinute_1 = 1,
    KLineMinute_3 = 3,
    KLineMinute_5 = 5,
    KLineMinute_15 = 15,
    KLineMinute_30 = 30,
    KLineMinute_60 = 60,
    KLineMinute_Day = 1440,
    KLineMinute_Week = 7200,
    KLineMinute_Month = 31680
};

typedef NS_ENUM(NSInteger,ERRORTIME) {
    KLineMinute_1_ERROR = 20,
    KLineMinute_3_ERROR = 20,
    KLineMinute_5_ERROR = 20,
    KLineMinute_15_ERROR = 20,
    KLineMinute_30_ERROR = 30,
    KLineMinute_60_ERROR = 60,
    KLineMinute_Day_ERROR = 60,
    KLineMinute_Week_ERROR = 60,
    KLineMinute_Month_ERROR = 60
};

#define Tag_PriceLine   9992
#define Tag_TimeLine    9982
#define Tag_SharTimeLine    9972
#define QUEUEVIEW_TAG   99
#define KLinePinchSensitivity 1 //缩放效率
#define KlinePinchCoefficient 17 //缩放系数
#define TimeLine_Width 26/667.0*Screen_Height //时间线所占高度
#define PriceLabel_Width 42/375.0*Screen_Width
#define LabelHeight 10.0/667*Screen_Height
#define KLinePinchCount  [SKLine_DataControl shared].pinchCountWithCandle

#define NO_DATA_KLINE   @"NO DATA"

//图表边界
#define Boundary        0

#define KLine_Price_font 8

//每页默认显示蜡烛条数
#define Control_Get_DefaultShowCandleNum [SKLine_DataControl shared].showCandleNum
//预加载页数
#define PreLoadingNum 0
#define KLine_Control_Num       50//K线图默认一屏幕条数
#define TimeSharing_Control_Num 100//分时图默认一屏幕条数
#define DateHeight              12//时间的高度









#endif /* SKLine_Configer_h */
