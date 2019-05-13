# Toast
Toast提示框

[简书介绍地址](https://www.jianshu.com/p/bdfb174ddcf9)

写了一个Swift版提示框，简单明了，有用到的同学可以自己下载 [Deom地址查看](https://github.com/bolagong/Toast)

首先来个效果图：   ![效果图.gif](https://upload-images.jianshu.io/upload_images/5261964-8d480d50b71378e1.gif?imageMogr2/auto-orient/strip)


### > 使用介绍:

* 1.只显示消息文本，(默认显示2.0s，位置center)
```
CBToast.showToastAction(message: "加载中。。。")
```

* 2.只显示消息文本，(自己定义时间和位置)
```
CBToast.showToast(message: "加载中。。。", aLocationStr: "bottom", aShowTime: 3.0)
```

* 3.只显示旋转，(需要自己显示和关闭)
```
//显示
CBToast.showToastAction()

//关闭
CBToast.hiddenToastAction()
```

* 4.显示旋转加消息文本，(需要自己显示和关闭)
```
//默认显示方法，（时间默认2.0s，位置默认center）
CBToast.showIndicatorToastAction(message: "加载中。。。")

//自己定义时间和位置
self.showIndicatorToast(message: "加载", aLocationStr: "top", aShowTime: 6.0)

//关闭
CBToast.hiddenIndicatorToastAction()
```

[简书介绍地址](https://www.jianshu.com/p/bdfb174ddcf9)
[Deom地址查看](https://github.com/bolagong/Toast)
