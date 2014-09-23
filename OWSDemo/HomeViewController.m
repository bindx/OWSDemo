//
//  HomeViewController.m
//  OWS
//
//  Created by Bindx on 9/11/14.
//  Copyright (c) 2014 Bindx. All rights reserved.
//

#import "HomeViewController.h"
#import "OWSManger.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"OWS";
}

- (IBAction)openWall:(id)sender {
    [OWSManger showWall:YES didShowBlock:^{
        NSLog(@"打开");
    } didDismissBlock:^{
        NSLog(@"关闭");
    }];
}


- (IBAction)queryIntegral:(id)sender {
    NSString * str = [NSString stringWithFormat:@"当前积分为:%@",[OWSManger rewardPoints]];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"积分查询" message:str delegate:nil cancelButtonTitle:@"calcel" otherButtonTitles:@"ok", nil];
    [alert show];
}

- (IBAction)usingIntegral:(id)sender {
    NSString * str = nil;

    if ([OWSManger spendPoints:@"20"]) {
        str = @"消费成功";
    }else{
        str = @"积分不足消费失败";
    }
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"积分消费" message:str delegate:nil cancelButtonTitle:@"calcel" otherButtonTitles:@"ok", nil];
    [alert show];
}



- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
