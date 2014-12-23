//
//  ViewController.m
//  OWSDEMO
//
//  Created by 公司 on 12/18/14.
//  Copyright (c) 2014 Bindx. All rights reserved.
//

#import "ViewController.h"
#import <AdSupport/ASIdentifierManager.h>
#import "OWSManger.h"
#import "OWSSpot.h"

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

/**
 查询积分
 */
- (IBAction)queryIntegral:(id)sender {
    NSString * message = [NSString stringWithFormat:@"当前积分为:%@",[OWSManger rewardPoints]];
    [self showAlertWithTitle:@"查询积分" Message:message AlertViewStyle:UIAlertViewStyleDefault delegate:nil cancelBtn:nil];
}

/**
 使用积分
 */
- (IBAction)usingIntegral:(id)sender {
    [self showAlertWithTitle:@"请输入使用的积分数" Message:nil AlertViewStyle:UIAlertViewStylePlainTextInput delegate:self cancelBtn:@"cancel"];
}


- (void)showAlertWithTitle:(NSString *)title Message:(NSString *)message AlertViewStyle:(UIAlertViewStyle)style delegate:(id)delegate cancelBtn:(NSString *)cancelBtnTitle{
    
    alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelBtnTitle otherButtonTitles:@"ok", nil];
    if (style) {
        [alert setAlertViewStyle:style];
        [[alert textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeNumberPad];
    }
    [alert show];
    
    //    alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    //    [alert show];
}

#pragma mark - UIAlertView delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1){
        NSString *str = [OWSManger spendPoints:[[alertView textFieldAtIndex:0]text]]?@"消费成功":@"积分不足消费失败";
        alert = [[UIAlertView alloc]initWithTitle:@"积分消费" message:str delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alert show];
    }
}

- (IBAction)podst:(id)sender {
    [OWSSpot requstSpotAdWithSucceed:^(BOOL isSucceed, NSError *error) {
        if(isSucceed){
            [OWSSpot showSpotWithCompleteBlock:^(BOOL isSucceed, NSError *error) {
                
            }];
        }
    }];
}

//- (IBAction)setMTKEY:(id)sender {
//    
//}
//
//- (IBAction)okClick:(id)sender {
//    NSLog(@"%@",self.mzkey.text);
//    [OWSManger setAdunitID:self.mzkey.text];
//}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end