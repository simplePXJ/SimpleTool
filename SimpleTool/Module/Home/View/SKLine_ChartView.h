//
//  SKLine_ChartVIew.h
//  SimpleTool
//
//  Created by PXJ on 2017/12/5.
//  Copyright © 2017年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SKLine_CandleView;

@interface SKLine_ChartView : UIView<SKLine_DataManageDelegate,SKLine_GesManagerDelegate>

@property (nonatomic,strong)SKLine_CandleView * candleView;
@property (nonatomic,strong)SKLine_DataManager * dataManager;
@property (nonatomic,strong)SKLine_GesManager * gesManager;
@end
