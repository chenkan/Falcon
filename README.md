## Falcon

A Ruby http test framework

## 一些约定

1. `api_for_interface`中存放封装后的`http`接口，这些接口`不含任何判定逻辑`，传入接口参数，返回http响应
2. `api_for_helper`中存放帮助类，包括业务层面的数据准备与清理
3. `test_case`中存放用例，一个用例对应一个接口，均含判定逻辑
   1. 用例互相之间不允许存在引用关系，应完全独立
   2. 尽量使用例篇幅短小，逻辑简单，易于理解
4. 整个框架结构要求简单清晰，层次少，易于阅读
5. 多人协作编写用例时，须定期`code review`确保以上约定实施

## 使用说明

1. 安装ruby`1.9.3`
2. 下载代码
3. 进入工程根目录执行`bundle install`安装依赖类库
4. 执行`ruby test_suite/photo_test_suite.rb`
5. 任何问题请在[issues](https://github.com/chenkan/Falcon/issues)留言

## TODO

1. 执行报表效果很差，须改进
2. 调研minitest[插件](https://github.com/seattlerb/minitest)
3. 框架实际应用与反馈
4. 对于如何有效打印日志信息还在思考中
