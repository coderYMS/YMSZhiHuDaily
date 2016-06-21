//
//  YMSLatestNewsModel.m
//  YMSZhiHuDaily
//
//  Created by mac on 16/6/21.
//  Copyright © 2016年 yms. All rights reserved.
//

#import "YMSLatestNewsModel.h"
#import "YMSHomeStoriesModel.h"
#import "YMSHomeTopStoryModel.h"

@implementation YMSLatestNewsModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"stories" : [YMSHomeStoriesModel class],
             @"top_stories" : [YMSHomeTopStoryModel class]
             };
}

@end
