
Pod::Spec.new do |s|
  s.name             = 'XKFileManager'
  s.version          = '0.0.1'
  s.summary          = '工具类'

  s.homepage         = 'https://github.com/RyanMans/XKFileManager'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ALLen、LAS' => '1696186412@qq.com' }
  s.source           = { :git => 'https://github.com/RyanMans/XKFileManager.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'XKFileManager/Classes/**/*'
end
