//
//  SKLine_DataControl.h
//  SimpleTool
//
//  Created by PXJ on 2017/12/5.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKLine_DataControl : NSObject

@property (nonatomic,assign)NSInteger       klineType;  //Default is KLineMinute_1

@property (nonatomic,assign)NSInteger       revealType;  //Default is LineDiagram

@property (nonatomic,assign)int             showCandleNum; //Default is 40

@property (nonatomic,assign)int             showLineNum;  //Default is 6

@property (nonatomic,assign)int             floatNum; //Default is 2

@property (nonatomic,strong)NSString        *instrumentCode;//CL

@property (nonatomic,strong)NSString        *instrumentID;//CL1609

@property (nonatomic,assign)NSInteger       pinchCountWithCandle;

@property (nonatomic,assign)NSInteger       pinchCountWithTimeSharing;


+(SKLine_DataControl *)shared;

@end
