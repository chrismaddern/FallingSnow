Pod::Spec.new do |s|
  s.name             = "FallingSnow"
  s.version          = "1.0.0"
  s.summary          = "Add falling snow to any view with one line of code."
  s.homepage         = "http://cm.wtf?project=snow"
  s.license          = 'MIT'
  s.author           = 'Chris Maddern'
  s.source           = { :git => "https://github.com/chrismaddern/FallingSnow.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/chrismaddern'

  s.platform         = :ios, '7.0'
  s.requires_arc     = true
  s.resources        = 'FallingSnow/Resources/*.png'
  s.source_files     = 'FallingSnow/*.{h,m}'
end
