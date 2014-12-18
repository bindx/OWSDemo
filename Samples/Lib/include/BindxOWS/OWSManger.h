//
//  testObj.h
//  OW
//
//  Created by Bindx on 14/8/9.
//  Copyright (c) 2014年 Bindx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OWSManger : NSObject

+ (OWSManger *)netshared;

//开发者key
@property (nonatomic,copy) NSString *adunit;
//广告位ID
@property (nonatomic,copy) NSString *rid;
//积分
@property (nonatomic,copy) NSString *score;
//GameID
@property (nonatomic,copy) NSString *gameidStr;
//是否允许应用内打开AppStore
@property (nonatomic) BOOL internal;
//经度
@property (nonatomic) float longitude;
//纬度
@property (nonatomic) float latitude;

//开发者广告位ID设置
+ (void)setAdunitID:(NSString *)key;

//是否允许应用内打开AppStore 默认NO不允许，YES允许
+ (void)setInternal:(BOOL)internalValue;

//设置GameID设置
+ (void)SetGameID:(NSString *)gameid;

//查询积分
+ (NSString *)rewardPoints;

//使用积分
+ (BOOL)spendPoints:(NSString *)points;

//打开积分墙并显示打开和关闭状态block回调
+ (BOOL)showWall:(BOOL)Probably didShowBlock:(void (^)(void))FinishCallBackBlock didDismissBlock:(void (^)(void))DismissCallBackBlock;


@end
