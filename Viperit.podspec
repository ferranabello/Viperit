# Viperit podspec
#
Pod::Spec.new do |s|
  s.name             = 'Viperit'
  s.version          = '0.3.0'
  s.summary          = 'Viper Framework for iOS written in Swift 3'

  s.description      = <<-DESC
Viper Framework for iOS to implement VIPER architecture in an easy way
                       DESC

  s.homepage         = 'https://github.com/ferranabello/Viperit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ferran Abelló' => 'ferran.abello@gmail.com' }
  s.source           = { :git => 'https://github.com/ferranabello/Viperit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/acferran'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Viperit/**/*.swift'
end
