//
//  YMSLaunchRequest.m
//  YMSZhiHuDaily
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 yms. All rights reserved.
//

#import "YMSLaunchRequest.h"
#import "YMSRequestTool.h"
#import <YYModel.h>
#import <SVProgressHUD.h>

static NSString * const kLaunchImageUrl = @"http://news-at.zhihu.com/api/4/start-image/720*1184";

@implementation YMSLaunchRequest

+ (void)getLaunchImageWithSuccess:(void(^)(YMSLaunchModel *launchModel))success{
    [YMSRequestTool GET:kLaunchImageUrl parameters:nil success:^(id responseObject) {
        YMSLaunchModel *model = [YMSLaunchModel yy_modelWithJSON:responseObject];
        success(model);
    } failure:^(NSError *error) {
//        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"网络不给力啊，亲~请稍后再试..."];
    }];
}

@end
