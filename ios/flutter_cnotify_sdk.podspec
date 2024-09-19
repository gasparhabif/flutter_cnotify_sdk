#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_cnotify_sdk.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_cnotify_sdk'
  s.version          = '0.1.0'
  s.summary          = 'This SDK is used to connect the integration with cnotify.me. platform that allows to send push notifications to your users.'
  s.description      = <<-DESC
    This SDK is used to connect the integration with cnotify.me. It provides functionality for handling push notifications and integrating with the cnotify.me service.
                       DESC
  s.homepage         = 'https://cnotify.web.app'
  s.license          = { :file => '../LICENSE' }
  s.authors             = { "Gaspar Habif" => "gaspar@eruka.tech", "Tomas Lofano" => "tomas@eruka.tech" }
  s.social_media_url   = "https://twitter.com/gasphabif"
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'CNotifySDK'
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  s.static_framework = true


  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'flutter_cnotify_sdk_privacy' => ['Resources/PrivacyInfo.xcprivacy']}
end
