#source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
#source 'https://github.com/CocoaPods/Specs.git'


platform :ios, '12.0'

install! 'cocoapods', :deterministic_uuids => false

target 'MuiltSelectDemo' do
  
  # 网络请求
#  pod 'AFNetworking'
  
  # 自动布局
  pod 'Masonry'
  
  # 图片展示
#  pod 'SDWebImage'
  
  pod 'YYText'
  
 
  
end

#post_install do |installer|
#     system('sh fix-build-for-xcode15.sh')
# end



#消除版本警告
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end
