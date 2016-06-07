# one-line-jpush-cordova
一行命令搞定 jpush-cordova 推送 / one line jpush cordova


### 使用方法
- 将 `install_jpush.py` 复制到 Cordova 项目的**根**目录下：
![](http://upload-images.jianshu.io/upload_images/1944178-61c4fdc6f082652f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

  然后在终端**进入该目录并执行**即可：
  
        ./install_jpush.py -appkey yourAppkey

  其中 `yourAppkey` 替换成准备工作中在[极光控制台](https://www.jpush.cn/common/apps)创建 app 时得到的 appkey
  *不会用终端的童鞋狂戳 [此处](#终端运行脚本方法)*

### 完成！！
![](http://upload-images.jianshu.io/upload_images/1944178-94784b5eec2c54dd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

戳 [这里](#立即推送) 即可立即推送并接受消息！

### 脚本说明
Cordova 的脚本帮大家做以下事情：

- 自动创建 iOS 项目
- 自动从 GitHub 上下载最新的 极光推送 [JPush Phonegap Plugin](https://github.com/jpush/jpush-phonegap-plugin) 插件
- 自动安装该插件到当前项目并添加必要配置

### 立即推送
---
进入[极光推送控制台](https://www.jpush.cn/common/apps)->yourAppName->推送->发送通知，点击**立即发送
**，在手机上即可立即收到推送消息！
  ![](http://upload-images.jianshu.io/upload_images/1944178-d988ea39b17da30d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


### 终端运行脚本方法
---
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




