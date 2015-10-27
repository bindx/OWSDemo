//
//  OWSSpot.h
//  OWSAd
//
//  Created by Bindx on 14/11/20.
//  Copyright (c) 2014年 Bindx. All rights reserved.
//

#import "OWSConfig.h"

@interface OWSSpot : NSObject

//请求广告
+ (void)requstSpotAdWithSucceed:(PosCompleteBlock)block;
//展示广告
+ (void)showSpotWithCompleteBlock:(PosCompleteBlock)block;

@end
