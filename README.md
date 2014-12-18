# OWS iOS SDK 开发者文档
======================

##1.下载SDK压缩包
#####（你下载的压缩包解压后包含了下面几个文件：）

文件夹        | 详情
------------ | ------------- 
Document     | 是SDK使用文档文件 
Lib          | 是SDK静态库包含libOWS.a静态库文件Bundle文件和头文件  
Samples      | 是SDK的例子  


####2.导入SDK文件

积分墙头文件   | Bundle文件     | 静态库文件
------------ | ------------- | ------------
OWSManger.h  | OWS.bundle    | libBindxOWS.a

####3.初始化SDK
<p></p>
######1） 在AppDelegate.m文件中添加头文件
SDK初始化     |  
------------ | ------------- 
 #import "OWSManger.h"|


######2）在AppDelegate.m  - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions方法中添加

SDK初始化 |  
------------ | ------------- 
[OWSManger setAdunitID:@"Your AppID”];|
//以下为可选|
[OWSManger setInternal:YES];//internalValue值为YES并且iOS系统>6.0 开启应用内打开AppStore|
[OWSManger setGameID:@"owsuser"];//设置GameID|
**注：Your AppID为你自己的appid必须替换**|





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

###### 2.积分查询和使用
<p></p>
* （使用积分）+ (NSString *)rewardPoints;
* （查询积分）+ (BOOL)spendPoints:(NSString *)points;

**[OWSManger spendPoints:@“[integral]”]//integral消费积分数量，返回值BOOL值YES消费积分成功NO消费失败**

####OWS SDK 常见问题解答
<p></p>
1.获取广告标示符（IDFA-identifierForIdentifier）的方法NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
<p></p>

### And more?
=============
关注GitHub随时获取最新SDK <https://github.com/bindx/OWSDemo.git>

Follow [@Bindx](https://github.com/bindx) on GitHub for the latest update.