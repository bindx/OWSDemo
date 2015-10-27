//
//  OWSConfig.h
//  OWSAd
//
//  Created by Bindx on 14/11/20.
//  Copyright (c) 2014年 Bindx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, OWSOrient) {
    OWSOrientHorizontal,    //横屏
    OWSOrientVertical       //竖屏
};

typedef NS_OPTIONS(NSUInteger, OWSType) {
    OWSType_phone4,  //---> 280x320
    OWSType_phone5,  //---> 280x408
    OWSType_phone6,  //---> 335x507
    OWSType_phone6p, //---> 374x576
    OWSType_Pad      //---> 728x664
};

typedef NS_OPTIONS(NSUInteger, OWSADType) {
    OWSADType_Half,
    OWSADType_Full
};

struct OWSSize
{
    OWSType type;
    OWSOrient orient;
    OWSADType adtype;
};

typedef struct OWSSize OWSSize;
typedef void (^PosCompleteBlock)(BOOL isSucceed, NSError *error);
