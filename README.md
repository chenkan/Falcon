##Falcon

A Ruby http test framework

##一些说明

1. `api_for_interface`中存放封装后的`http`接口，这些接口`不含任何判定逻辑`，进接口参数，出http响应
2. `api_for_helper`中存放帮助类，包括业务层面的数据准备与清理
3. `test_case`中存放用例，一个用例对应一个接口，均含判定逻辑
   1. 用例互相之间不允许存在引用关系，应完全独立
   2. 尽量使用例篇幅短小，逻辑简单，易于理解
4. 整个框架结构要求简单清晰，层次少，易于阅读

##TODO

1. 是否存在类似于testNG的框架
2. 执行报表效果很差，须改进
3. 调研minitest[插件](https://github.com/seattlerb/minitest)

