# OWS iOS SDK 开发者文档

##1.下载SDK压缩包
#####（你下载的压缩包解压后包含了下面几个文件：）

######Document	文件夹是SDK使用文档
<p></p>
<p>Lib		    文件夹是SDK静态库包含libOWS.a静态库文件Bundle文件和头文件</p>
<p>Samples	    文件夹是SDK的例子</p>

####2.导入SDK文件
<p></p>
<p>积分墙的头文件为</p>
<p>OWSManger.h</p>
<p>Bundle文件为</p>
<p>OWS.bundle</p>
<p>静态库文件为</p>
<p>libBindxOWS.a</p>

####3.初始化SDK
<p></p>
######1） 在AppDelegate.m文件中添加头文件
 *#import "OWSManger.h"* 


######2）在AppDelegate.m  - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions方法中添加
<p>[OWSManger setAdunitID:@"[Your AppID]”];</p>
<p>//可选</p>
<p>[OWSManger setInternal:YES];//internalValue值为YES并且iOS系统>6.0 开</p><p>启应用内打开AppStore</p>
<p>[OWSManger setGameID:@"owsuser"];//设置GameID(可选)</p>
<p>注：Your AppID为你自己得appid必须替换</p>


###调用积分墙广告

###### 1.使用积分墙
 <p></p>
 #import “OWSManger.h" 
<p>…</p>
<p>…</p>
<p>   [OWSManger showWall:YES didShowBlock:^{</p>
<p>        NSLog(@"打开");</p>
<p>    } didDismissBlock:^{</p>
<p>        NSLog(@"关闭");</p>
<p>    }];</p>
<p>…</p>


###### 2.积分查询和使用
<p></p>
（使用积分） + (NSString *)rewardPoints;
（查询积分）
+ (BOOL)spendPoints:(NSString *)points;

**[OWSManger spendPoints:@“[integral]”]//integral消费积分数量，返回值BOOL值YES消费积分成功NO消费失败**

####OWS SDK 常见问题解答
<p></p>
1.获取广告标示符（IDFA-identifierForIdentifier）的方法NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
<p></p>
###关注GitHub随时获取最新版SDK <https://github.com/bindx/OWSDemo.git>