# DSPopUpViewController

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/walkdianzi/DSPopUpViewController/blob/master/LICENSE)&nbsp;

简单的弹出浮层

#如何使用

先创建ViewController继承自DSPopUpViewController   
然后在ViewController创建一些自定义的控件及其他操作   
浮层弹出显示直接调用以下代码   
```objectivec
[xxxViewController showInViewController:self.navigationController animated:YES isMaskView:YES];
```

#待补充功能(如果你有兴趣也欢迎提交代码)
1. PositionMiddle从中间弹出
2. 使用UIView，底部未遮罩部分可点击

#最后
- 如果我的项目对你有帮助欢迎 Star  
- 如果在使用过程中遇到BUG，希望你能Issues我
- 如果在使用过程中发现功能不够用或者想交流的，希望你能Issues我，或者联系我QQ：398411773
- 如果你想为DSPopUpViewController输出代码，请拼命Pull Requests我
