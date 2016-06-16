//
//  YMSRequestTool.h
//  YMSZhiHuDaily
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 yms. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successBlock)(id responseObject);
typedef void(^failBlock)(NSError *error);

@interface YMSRequestTool : NSObject

//普通请求
+(void)GET:(NSString *)URLString
parameters:(id)parameters
   success:(successBlock)success
   failure:(failBlock)failure;

/**
 *  发文件
 *
 *  @param URLString  请求地址
 *  @param parameters 请求参数
 *  @param data       文件数据
 *  @param name       文件字段名
 *  @param saveName   保存的名字（可能后台不用）
 *  @param mimeType   类型
 *  @param success    成功回调
 *  @param failure    失败回调
 */
+(void)post:(NSString *)URLString
 parameters:(id)parameters
   fileData:(NSData *)data
   fileName:(NSString *)name
   saveName:(NSString *)saveName
content_type:(NSString *)mimeType
    success:(successBlock)success
    failure:(failBlock)failure;


@end
