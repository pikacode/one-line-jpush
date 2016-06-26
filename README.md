# one-line-jpush
##### iOS 工程： 终端一行命令集成极光推送服务，并且立刻就能接收推送。（配置好证书、并注册appkey的情况下）
##### for iOS project：one line in terminal achieve push notification（after Certificate configuration，and regist an appkey for your app）

 


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
        ./install_jpush.py -appkey yourAppkey

  ![](http://upload-images.jianshu.io/upload_images/1944178-2443aff407059267.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

5.等待显示`successfully`等字样则安装完成
