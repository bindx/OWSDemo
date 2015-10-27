# Coffat iOS SDK 开发者文档

##下载SDK压缩包
#####（你下载的压缩包解压后包含了下面几个文件：）

文件夹        | 详情
------------ | ------------- 
README.md    | 是SDK使用文档文件 
CoffatAdv.framework    | 是SDK库文件
Samples      | 是SDK的Demo

####1.导入SDK文件

积分墙头文件   | SDK文件
------------ | ------------
OWSManger.h  | CoffatAdv.framework
OWSConfig.h  |	  		  \
OWSSpot.h    |		  		  \

####2.导入Framework

```
StoreKit.framework
AdSupport.framework
SystemConfiguration.framework
CoreLocation.framework
```

####3.初始化SDK
<p></p>
######1）在AppDelegate.m文件中添加头文件
```
 #import "OWSManger.h"
```

######2）在AppDelegate.m

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions方法中添加

SDK初始化 |  
------------ | ------------- 
[OWSManger setAdunitID:@"这里填写你的Adu" AndEncryption:@"这里填写你的Key"];|
[OWSManger setCallBackUrl:@"这里填写你的服务器回调地址"];|
//以下为可选|
[OWSManger setInternal:YES];//internalValue值为YES并且iOS系统>6.0 开启应用内打开AppStore|
[OWSManger setGameID:@"gameId"];//设置GameID|
**注：Adu和Key必须填写**|

###调用积分墙广告

###### 1.使用积分墙
```
 #import “OWSManger.h" 
 ...
- (IBAction)openWall:(id)sender {
    [OWSManger showWall:YES didShowBlock:^{
        NSLog(@"积分墙已打开");
    } didDismissBlock:^{
        NSLog(@"积分墙已关闭");
    }];
}
...
```


###调用插屏广告
###### 1.使用插屏广告
```
- (IBAction)podst:(id)sender {
    [OWSSpot requstSpotAdWithSucceed:^(BOOL isSucceed, NSError *error) {
        if(isSucceed){
            [OWSSpot showSpotWithCompleteBlock:^(BOOL isSucceed, NSError *error) {
            }];
        }
    }];
}
```


####OWS SDK 常见问题解答
<p></p>
1.获取广告标示符（IDFA-identifierForIdentifier）的方法NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
<p></p>

### And more?
=============


关注GitHub随时获取最新SDK <https://github.com/bindx/OWSDemo.git>

Follow [@Bindx](https://github.com/bindx) on GitHub for the latest update.
