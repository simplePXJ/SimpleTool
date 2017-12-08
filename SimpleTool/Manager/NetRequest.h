//
//  NetRequest.h
//  SimpleTool
//
//  Created by PXJ on 2017/12/4.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetRequest : NSObject

/**
 *获取文件
 */
+(void)getRequestWithURL:(NSString *)url
                complete:(void(^)(NSString *))complete;

@end
