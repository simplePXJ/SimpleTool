//
//  SKLine_DataNet.m
//  SimpleTool
//
//  Created by PXJ on 2017/12/5.
//  Copyright © 2017年 com. All rights reserved.
//

#import "SKLine_DataNet.h"

@implementation SKLine_DataNet

+(SKLine_DataNet*)shared;
{
    static SKLine_DataNet * klineDataNet = nil;
    klineDataNet = [[SKLine_DataNet alloc] init];
    klineDataNet.currentDate = [klineDataNet getDate];
    klineDataNet.recordFailCount = 0;
    return klineDataNet;
}
-(void)getKLineDataOfToday:(void(^)(NSMutableArray *dataArray))complete{
    [self getKLineDataWithDate:[self getDate]
                      complete:^(BOOL Success, NSMutableArray *dataArray) {
        complete(dataArray);
    }];
}
-(void)getKlineBehindData{
    WS(ws);
    self.currentDate = [self getBehindDate];
    NSLog(@"getKlineBehindData_________%d",(int)self.currentDate);
    [self getKLineDataWithDate:_currentDate complete:^(BOOL Success, NSMutableArray *dataArray) {
        if(!Success&&_recordFailCount<=8){
            _recordFailCount++;
            [ws getKlineBehindData];
        }else{
            if ([[ws delegate] respondsToSelector:@selector(dataNetWithBehindData:)]) {
                [ws.delegate dataNetWithBehindData:dataArray];
            }
        }
    }];
}
- (NSString*)dealRequestDateWithDate:(NSInteger)aDate
{
    NSString *requestURL = [Helper timeTransform:[NSString stringWithFormat:@"%ld",(long)aDate] intFormat:@"yyyyMMdd" toFormat:@"yyyy-MM-dd"];
    return requestURL;
}

-(void)getKLineDataWithDate:(NSInteger)date
                complete:(void(^)(BOOL Success, NSMutableArray *dataArray))complete;
{
   
    NSString *instrumentCode = @"HSI1712";
    NSString *requestDate = [self dealRequestDateWithDate:date];
    NSString *kLinefileName = [NSString stringWithFormat:@"%@_%@_1.k",instrumentCode,requestDate];
    NSString * URL              = [NSString stringWithFormat:@"%@/futuresquota/%@/%@",K_DOMAIN_FILE,instrumentCode,kLinefileName];
    NSLog(@"%@",URL);
    [NetRequest getRequestWithURL:URL complete:^(NSString *str) {
        NSLog(@"currentIndex%d",(int)_currentDate);
        if (str.length < 2) {
            complete(NO,nil);
            return ;
        }
        if ([str rangeOfString:@"404 Not Found"].location == NSNotFound && [str rangeOfString:@"<body>"].location == NSNotFound){
            str = [str stringByReplacingOccurrencesOfString:@"}," withString:@"}"];
            NSMutableArray     *tmpArray = [NSMutableArray arrayWithArray:[str componentsSeparatedByString:@"}"]];
            if (tmpArray.count > 0) {
                _recordFailCount = 0;
                complete(YES,tmpArray);
            }
            else{
                complete(NO,nil);
            }
        }
        else{
            complete(NO,nil);
        }
    }];
}


-(NSInteger)getDate{
    NSDateFormatter * dateFormatter = [SPDateManager sharedInstance].dateFormatter;
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSDate *date = [NSDate date];
    NSString *newDataStr = [dateFormatter stringFromDate:date];
    return [newDataStr integerValue];
}

-(NSInteger)getBehindDate{
    NSDateFormatter * dateFormatter = [SPDateManager sharedInstance].dateFormatter;
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSDate *dateCurrent = [dateFormatter dateFromString:[NSString stringWithFormat:@"%ld",_currentDate]];
    NSDate *dateBehind = [NSDate dateWithTimeInterval:-24*60*60 sinceDate:dateCurrent];
    NSString *newDataStr = [dateFormatter stringFromDate:dateBehind];
    return [newDataStr integerValue];
}
@end
