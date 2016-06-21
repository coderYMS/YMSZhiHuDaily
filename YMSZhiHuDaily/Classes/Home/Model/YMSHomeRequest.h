//
//  YMSHomeRequest.h
//  YMSZhiHuDaily
//
//  Created by mac on 16/6/21.
//  Copyright © 2016年 yms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMSLatestNewsModel.h"

@interface YMSHomeRequest : NSObject

+ (void)getLatestNewsWithSuccess:(void(^)(YMSLatestNewsModel *result))success;

@end
