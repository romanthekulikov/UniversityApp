platform :ios, '16.2'

target 'UniversityApp' do
	pod 'PromisesSwift'
	pod 'PromisesObjC'
	pod 'Moya-ObjectMapper', '~> 2.9'
	
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end