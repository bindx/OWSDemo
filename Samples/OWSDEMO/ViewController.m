//
//  ViewController.m
//  OWSDEMO
//
//  Created by 公司 on 12/18/14.
//  Copyright (c) 2014 Bindx. All rights reserved.
//

#import "ViewController.h"
#import <AdSupport/ASIdentifierManager.h>
#import <CoffatAdv/OWSManger.h>

@interface ViewController ()<UIAlertViewDelegate>{
    UIAlertView *alert;
}

@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"OWS Demo";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"idfa" style:UIBarButtonItemStylePlain target:self action:@selector(idfaShow)];//为导航栏添加右侧按钮
}

- (void)idfaShow{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    [self showAlertWithTitle:@"IDFA(已复制到剪切板)" Message:pasteboard.string AlertViewStyle:UIAlertViewStyleDefault delegate:nil cancelBtn:nil];
}

/**
 打开积分墙
 */
- (IBAction)openWall:(id)sender {
    [OWSManger showWall:YES didShowBlock:^{
        NSLog(@"打开");
    } didDismissBlock:^{
        NSLog(@"关闭");
    }];
}

- (void)showAlertWithTitle:(NSString *)title Message:(NSString *)message AlertViewStyle:(UIAlertViewStyle)style delegate:(id)delegate cancelBtn:(NSString *)cancelBtnTitle{
    
    alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelBtnTitle otherButtonTitles:@"ok", nil];
    if (style) {
        [alert setAlertViewStyle:style];
        [[alert textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeNumberPad];
    }
    [alert show];

}




- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end