# vim配置

## 安装
将所有文件放到.vim下 替换.vimrc

## 支持的功能

自动补全，函数跳转，目录树等等  
可简单的替换ide  

## 简单使用

F2 打开关闭目录树  
F3 打开关闭tagbar  

安装Ctags  
在项目跟目录输入:  

```
$ ctags -R *
```
生成一个索引文件  
使用Ctrl + ] 和 Ctrl + O 在函数间跳转和跳回  

cscope几个简单的功能  

```
:cs find s 查找函数名、宏、枚举出现的地方
:cs find g 类似上面ctags的功能
:cs find d 查找当前函数调用的函数
:cs find t 查找指定的字符串
:cs find f 查找文件
```

