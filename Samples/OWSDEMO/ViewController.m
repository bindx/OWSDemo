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
    UIAlertView * alertt = [[UIAlertView alloc]initWithTitle:@"IDFA(已复制到剪切板)" message:pasteboard.string delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertt show];
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
    NSString * str = [NSString stringWithFormat:@"当前积分为:%@",[OWSManger rewardPoints]];
    alert = [[UIAlertView alloc]initWithTitle:@"积分查询" message:str delegate:nil cancelButtonTitle:@"calcel" otherButtonTitles:@"ok", nil];
    [alert show];
}

/**
 使用积分
 */
- (IBAction)usingIntegral:(id)sender {
    alert = [[UIAlertView alloc]initWithTitle:@"请输入使用的积分数" message:nil delegate:self cancelButtonTitle:@"calcel" otherButtonTitles:@"ok", nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [[alert textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeNumberPad];
    [alert show];
}


#pragma mark - UIAlertView delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1){
        NSString *str = [OWSManger spendPoints:[[alertView textFieldAtIndex:0]text]]?@"消费成功":@"积分不足消费失败";
        alert = [[UIAlertView alloc]initWithTitle:@"积分消费" message:str delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alert show];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
