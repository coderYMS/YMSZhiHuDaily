//
//  YMSLaunchRequest.h
//  YMSZhiHuDaily
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 yms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMSLaunchModel.h"


@interface YMSLaunchRequest : NSObject

+ (void)getLaunchImageWithSuccess:(void(^)(YMSLaunchModel *launchModel))success;

@end
