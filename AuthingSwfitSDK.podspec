#
# Be sure to run `pod lib lint AuthingSwfitSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AuthingSwfitSDK'
  s.version          = '0.1.1'
  s.summary          = 'AuthingSwfitSDK. zhaozhao test for https://authing.cn'
  s.swift_version    = '5.3'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
AuthingSwfitSDK. zhaozhao test for https://authing.cn测试没有问题后删除，后续移交到authing仓库
                       DESC

  s.homepage         = 'https://github.com/andyzhaozhao/AuthingSwfitSDK.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'andy_zhaozhao@hotmail.com' => 'andy_zhaozhao@hotmail.com' }
  s.source           = { :git => 'https://github.com/andyzhaozhao/AuthingSwfitSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'AuthingSwfitSDK/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AuthingSwfitSDK' => ['AuthingSwfitSDK/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
#s.dependency 'Alamofire', '~> 5.3.0'
s.dependency 'SwiftyRSA'
s.dependency 'Alamofire'
end
