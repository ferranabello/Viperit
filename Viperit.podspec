# Viperit podspec
#
Pod::Spec.new do |s|
  s.name             = 'Viperit'
  s.version          = '1.5.0'
  s.summary          = 'Viper Framework for iOS written in Swift'

  s.description      = <<-DESC
Viper Framework for iOS to implement VIPER architecture in an easy way
                       DESC

  s.homepage         = 'https://github.com/ferranabello/Viperit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ferran Abelló' => 'ferran.abello@gmail.com' }
  s.source           = { :git => 'https://github.com/ferranabello/Viperit.git', :tag => s.version.to_s }
  s.weak_framework = 'SwiftUI'
  s.social_media_url = 'https://twitter.com/acferran'
  s.swift_version = '5'

  s.ios.deployment_target = '12.0'
  s.source_files = 'Viperit/**/*.swift'
end
