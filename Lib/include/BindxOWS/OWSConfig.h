//
//  OWSConfig.h
//  OWSAd
//
//  Created by Bindx on 14/11/20.
//  Copyright (c) 2014年 Bindx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    OWSOrientHorizontal,    //横屏
    OWSOrientVertical       //竖屏
} OWSOrient;

typedef enum
{
    OWSType_phone4,
    OWSType_phone5,
    OWSType_phone6,
    OWSType_phone6p,
    OWSType_Pad
}OWSType;

struct OWSSize
{
    OWSType type;
    OWSOrient orient;
};

typedef struct OWSSize OWSSize;

typedef void (^PosCompleteBlock)(BOOL isSucceed, NSError *error);

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)