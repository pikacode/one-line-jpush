# one-line-jpush-native
one line jpush native


### 使用方法
- 将 `install_jpush.rb` 复制到项目**根目录的跟项目同名文件夹**下(如：/HelloWorld/HelloWorld/)

  ![](http://upload-images.jianshu.io/upload_images/1944178-1ad2a0fd6fa02e4d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 然后在终端**进入该目录并执行**即可：

      ruby install_jpush.rb -appkey yourAppkey

  其中 `yourAppkey` 替换成准备工作中在[极光控制台](https://www.jpush.cn/common/apps)创建 app 时得到的 appkey
  *不会用终端的童鞋狂戳 [此处](#终端运行脚本方法)*

### 完成！！

![](http://upload-images.jianshu.io/upload_images/1944178-16296d87369d28cc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

戳 [这里](#立即推送) 即可立即推送并接受消息！

 
### 脚本说明
native 的脚本帮大家做以下事情：
- 自动从极光官网下载并安装 [极光推送最新版本 SDK](http://docs.jpush.io/updates/#jpush-ios-sdk-v217) 到根目录所在项目中
- 自动写入**启动 SDK**及**接收推送**的必要代码 (在 AppDelegate.m 中)
- 添加必要的库到 iOS project 中

## 立即推送

进入[极光推送控制台](https://www.jpush.cn/common/apps)->yourAppName->推送->发送通知，点击**立即发送
**，在手机上即可立即收到推送消息！
  ![](http://upload-images.jianshu.io/upload_images/1944178-d988ea39b17da30d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240) 

## 终端运行脚本方法

完全不会终端的童鞋看这里

1. 在 Launcpad 中打开 Mac OSX 的终端应用

![](http://upload-images.jianshu.io/upload_images/1944178-6ac4c6c96f822863.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

2. 先输入 **`cd 空格`**
3. 再在已经复制到项目根目录中的 `install_jpush.py` 文件点击**右键**选择 `显示简介`，双击以全选弹出的菜单中`位置`后面的内容

  ![](http://upload-images.jianshu.io/upload_images/1944178-e6ff578d36dfd314.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

4. 复制绝对路径到终端`cd 空格`的后面，并回车，输入安装命令：
       //native
       ruby install_jpush.rb -appkey yourAppkey    
       //cordova
       ./install_jpush.py -appkey yourAppkey   
       //cocos2d-x
       ruby install_jpush.rb -appkey yourAppkey -project projectName    

  ![](http://upload-images.jianshu.io/upload_images/1944178-2443aff407059267.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

5.等待显示`successfully`等字样则安装完成
