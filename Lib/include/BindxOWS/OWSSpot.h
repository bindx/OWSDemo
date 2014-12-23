//
//  OWSSpot.h
//  OWSAd
//
//  Created by Bindx on 14/11/20.
//  Copyright (c) 2014年 Bindx. All rights reserved.
//

#import "OWSConfig.h"

@interface OWSSpot : NSObject

+ (void)requstSpotAdWithSucceed:(PosCompleteBlock)block;

+ (void)showSpotWithCompleteBlock:(PosCompleteBlock)block;

@end
