//
//  SPDataManager.m
//  SimpleTool
//
//  Created by PXJ on 2017/11/29.
//  Copyright © 2017年 com. All rights reserved.
//

#import "SPDateManager.h"

@implementation SPDateManager

+(SPDateManager *)sharedInstance{
    static dispatch_once_t once;
    static SPDateManager * singleton;
    dispatch_once( &once,^{
        singleton = [[SPDateManager alloc] init];
        singleton.dateFormatter = [[NSDateFormatter alloc] init];
    });
    return singleton;
}

- (NSNumber *)timeStamp_now;
{
    NSDate * nowDate = [NSDate date];
    NSNumber * timeStamp = [NSNumber numberWithDouble:[nowDate timeIntervalSince1970]*1000];
    return timeStamp;
}
- (NSDate *)nowDate
{
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    
    _nowDate = localeDate;
    return _nowDate;
}

- (NSString *)nowDateStr
{
    NSDateFormatter * dateFormatter = [SPDateManager sharedInstance].dateFormatter ;
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    _nowDateStr = [dateFormatter stringFromDate:[NSDate date]];
    return _nowDateStr;
    
}
@end
