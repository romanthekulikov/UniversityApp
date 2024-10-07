platform :ios, '16.2'

use_frameworks!

target 'UniversityApp' do
	inherit! :search_paths

	pod 'PromisesSwift'
	pod 'PromisesObjC'
	pod 'Moya-ObjectMapper', '~> 2.9'
	pod 'RealmSwift', '~> 10.33.0'
	pod 'Toast-Swift', '~> 5.1.1'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end