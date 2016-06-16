//
//  YMSRequestTool.m
//  YMSZhiHuDaily
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 yms. All rights reserved.
//

#import "YMSRequestTool.h"
#import <AFNetworking.h>

@implementation YMSRequestTool

+(void)GET:(NSString *)URLString
parameters:(id)parameters
   success:(successBlock)success
   failure:(failBlock)failure{

    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] initWithDictionary:parameters];
  
    if (!paramDic) {
        paramDic = [[NSMutableDictionary alloc] initWithCapacity:0];
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects: @"text/html",@"application/json", nil];
    
    [manager GET:URLString parameters:paramDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];

}

+(void)post:(NSString *)URLString
 parameters:(id)parameters
   fileData:(NSData *)data
   fileName:(NSString *)name
   saveName:(NSString *)saveName
content_type:(NSString *)mimeType
    success:(successBlock)success
    failure:(failBlock)failure{
    
}

@end
