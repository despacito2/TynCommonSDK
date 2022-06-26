# #
# # Be sure to run `pod lib lint TynCommonSDK.podspec' to ensure this is a
# # valid spec before submitting.
# #
# # Any lines starting with a # are optional, but their use is encouraged
# # To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
# #

# Pod::Spec.new do |s|
#   s.name             = 'TynCommonSDK'
#   s.version          = '0.1.0'
#   s.summary          = 'A short description of TynCommonSDK.'

# # This description is used to generate tags and improve search results.
# #   * Think: What does it do? Why did you write it? What is the focus?
# #   * Try to keep it short, snappy and to the point.
# #   * Write the description between the DESC delimiters below.
# #   * Finally, don't worry about the indent, CocoaPods strips it!

#   s.description      = <<-DESC
# TODO: Add long description of the pod here.
#                        DESC

#   s.homepage         = 'https://github.com/despacito2/TynCommonSDK'
#   # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
#   s.license          = { :type => 'MIT', :file => 'LICENSE' }
#   s.author           = { 'despacito2' => '1756110665@qq.com' }
#   s.source           = { :git => 'https://github.com/despacito2/TynCommonSDK.git', :tag => s.version.to_s }
#   # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

#   s.ios.deployment_target = '10.0'

#   s.source_files = 'TynCommonSDK/Classes/**/*'
  
#   # s.resource_bundles = {
#   #   'TynCommonSDK' => ['TynCommonSDK/Assets/*.png']
#   # }

#   # s.public_header_files = 'Pod/Classes/**/*.h'
#   # s.frameworks = 'UIKit', 'MapKit'
#   # s.dependency 'AFNetworking', '~> 2.3'
# end






s.name        = 'TynCommonSDK' #项目名称
s.version      = "1.0.0" #版本号 要和接下来上传git的tag版本号一致
s.summary      = "田宴宁的库" #这里对你写的库进行简要的概述一下
s.description  = <<-DESC
这就是一个测试，没别的，你信不信？（这里对你写的库进行具体的使用方法说明及其他描述，稍微写一下就行后期再整改）
                   DESC
s.homepage     = "https://github.com/despacito2/TynCommonSDK"# 你git库的地址首页,可以在开元中国创建你的库,不需要使用什么初始化方法,不要勾选 readme
s.license          = { :type => 'MIT', :file => 'LICENSE' } #这里不需要改变,使用默认,文件指向的文件名与工程中文件名要一致。
s.author           = { 'despacito2' => '1756110665@qq.com' } #作者信息：账户名，账户邮箱地址
s.source           = { :git => 'https://github.com/despacito2/TynCommonSDK.git', :tag => s.version.to_s } # 这里输入邮箱如果你在开元中国申请的 git 账号,那么把你在开元中国创建的项目的 https 网址输入到这里,
s.platform     = :ios
s.platform     = :ios, "9.0" #iOS 支持的最低级别,这里最低9.0
# s.frameworks = "CoreVideo","OpenGLES","AVFoundation","CoreMedia","VideoToolbox","AudioToolbox" #这里输入需要用到的依赖库,如果没有特别的需要可以不用输入直接注释掉
# s.vendored_frameworks = 'TestSDK_iOS/Classes/TestSDK.framework' #静态库文件的依赖，意思是执行到Classes文件夹下检索.framework类型的文件，我们放入的是动态库文件需要写入进行标注
s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }  # 如果项目已经设置 pod_target_xcconfig，添加到已有值的后面。此处解决了模拟器和真机包合并问题
