//
//  YMSHomeStoriesModel.m
//  YMSZhiHuDaily
//
//  Created by mac on 16/6/21.
//  Copyright © 2016年 yms. All rights reserved.
//

#import "YMSHomeStoriesModel.h"

@implementation YMSHomeStoriesModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"story_id" : @"id"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"images" : [NSString class]
             };
}

@end
