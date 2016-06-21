//
//  MainHeader.h
//  YMSZhiHuDaily
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 yms. All rights reserved.
//

#ifndef MainHeader_h
#define MainHeader_h

#define kScreenBounds [UIScreen mainScreen].bounds
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kThemeColor [UIColor colorWithRed:60.f/255.f green:198.f/255.f blue:253.f/255.f alpha:1.f];
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define SET_WHITE_STATUSBAR     do {[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;} while (0);
#define SET_BLACK_STATUSBAR     do {[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;} while (0);

#endif /* MainHeader_h */
