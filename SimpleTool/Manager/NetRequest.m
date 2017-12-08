//
//  NetRequest.m
//  SimpleTool
//
//  Created by PXJ on 2017/12/4.
//  Copyright © 2017年 com. All rights reserved.
//

#import "NetRequest.h"

@implementation NetRequest


+ (void)getRequestWithData:(NSDictionary *)dic
                      func:(NSString *)func
                       cmd:(NSString*)cmd
              successBlock:(void(^)(NSDictionary *dictionary))successBlock
              failureBlock:(void(^)(NSError *error))failureBlock
{
    
    NSTimeInterval  timeTnterval    = [[NSDate date] timeIntervalSince1970];
    NSString * data                 = @"{}";
    if (dic) {
        data = [Helper toJSON:dic];
    }
    //    data = [data stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    data = [data stringByReplacingOccurrencesOfString:@" " withString:@""];
    data = [data stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSString * brand = @"000001";
    NSDictionary * requestDic = @{@"clientVersion":@"2.3.1",
                                  @"brand":brand,
                                  @"func":func,
                                  @"cmd":cmd,
                                  @"data":data,
                                  @"md5":[[NSString stringWithFormat:@"%@LT7",data] MD5Digest],
                                  @"token":@"test",
                                  @"timestamp":[NSNumber numberWithDouble:timeTnterval*1000],
                                  @"deviceType":@"iOS",
                                  @"deviceNum":@" "};
    NSDictionary * parameters = @{@"msg":[Helper toJSON:requestDic]};
    NSString * url = [NSString stringWithFormat:@"%@/api",K_DOMAIN_URL];
    NSString * requestDicString = [Helper toJSON:requestDic];
    
    AFHTTPSessionManager * manager     = [AFHTTPSessionManager manager];
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy = securityPolicy;
    manager.requestSerializer.timeoutInterval   = 10.0f;
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager POST:url
       parameters:parameters
         progress:^(NSProgress * _Nonnull uploadProgress) {
             
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
             NSLog(@"\n__________________请求结束\nURL:\n%@?msg=%@\nresult:\n%@",url,requestDicString,[Helper toJSON:responseObject]);
             successBlock(responseObject);
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"\n__________________请求结束\nURL:%@?msg=%@\nresult:%@",url,requestDicString,error.localizedDescription);
             failureBlock(error);
 
         }];
    
    
}

/**
 *获取文件
 */
+(void)getRequestWithURL:(NSString *)url
                complete:(void(^)(NSString *))complete{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager.securityPolicy setAllowInvalidCertificates:YES];
    manager.requestSerializer.timeoutInterval = 10.0f;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"text/html",@"text/plain"]];
    [manager GET:url
      parameters:[NSString stringWithFormat:@"t=%ld",arc4random()%100000000000000]
        progress:^(NSProgress * _Nonnull downloadProgress) {
        }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             complete([[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             if ([task.taskDescription rangeOfString:@"0x"].location != NSNotFound) {
                 complete(@"");
             }
             else{
                 complete(task.taskDescription);
             }
             NSLog(@"%@",error.localizedDescription);
         }];
}
@end
