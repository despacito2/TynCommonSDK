Pod::Spec.new do |s|
s.name         = 'TynCommonSDK' #项目名称
s.version      = "1.2.0" #版本号 要和接下来上传git的tag版本号一致
s.summary      = "田宴宁的库" #这里对你写的库进行简要的概述一下
s.description  = <<-DESC
这就是一个测试，没别的，你信不信？（这里对你写的库进行具体的使用方法说明及其他描述，稍微写一下就行后期再整改）
                   DESC
s.homepage     = "https://github.com/despacito2/TynCommonSDK"# 你git库的地址首页,可以在开元中国创建你的库,不需要使用什么初始化方法,不要勾选 readme
s.license      = { :type => 'MIT', :file => 'LICENSE' } #这里不需要改变,使用默认,文件指向的文件名与工程中文件名要一致。
s.author       = { 'despacito2' => '1756110665@qq.com' } #作者信息：账户名，账户邮箱地址
s.source       = { :git => 'https://github.com/despacito2/TynCommonSDK.git', :tag => s.version.to_s } # 这里输入邮箱如果你在开元中国申请的 git 账号,那么把你在开元中国创建的项目的 https 网址输入到这里,
s.platform     = :ios
s.platform     = :ios, "13.0" #iOS 支持的最低级别,这里最低9.0
s.swift_version = '5.0'
s.source_files = 'TynCommonSDK/Classes/**/*'
s.dependency "BRPickerView"
s.dependency "WCDBSwift"
s.dependency "IQKeyboardManagerSwift"
s.dependency "MBProgressHUD"
s.dependency "JXPagingView/Paging"
s.dependency "JXSegmentedView" #这里输入需要用到的依赖库,如果没有特别的需要可以不用输入直接注释掉
s.dependency "Firebase/AnalyticsWithoutAdIdSupport"
s.dependency "CYLTabBarController"
s.frameworks   = 'UIKit', 'Foundation' #静态库文件的依赖，意思是执行到Classes文件夹下检索.framework类型的文件，我们放入的是动态库文件需要写入进行标注
s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }  # 如果项目已经设置 pod_target_xcconfig，添加到已有值的后面。此处解决了模拟器和真机包合并问题
end
