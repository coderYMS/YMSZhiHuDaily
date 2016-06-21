//
//  YMSHomeRequest.m
//  YMSZhiHuDaily
//
//  Created by mac on 16/6/21.
//  Copyright © 2016年 yms. All rights reserved.
//

#import "YMSHomeRequest.h"
#import "YMSRequestTool.h"
#import <YYModel.h>
#import <SVProgressHUD.h>

static NSString * const kLatestNewsUrl = @"http://news-at.zhihu.com/api/4/news/latest";

@implementation YMSHomeRequest

+ (void)getLatestNewsWithSuccess:(void(^)(YMSLatestNewsModel *result))success {
    [YMSRequestTool GET:kLatestNewsUrl parameters:nil success:^(id responseObject) {
        YMSLatestNewsModel *model = [YMSLatestNewsModel yy_modelWithJSON:responseObject];
        !success ? : success(model);
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"网络不给力啊，亲~请稍后再试..."];
    }];
}

@end
