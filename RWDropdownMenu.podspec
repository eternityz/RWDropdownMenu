Pod::Spec.new do |s|

  s.name         = "RWDropdownMenu"
  s.version      = "1.0.1"
  s.summary      = "Stylish drop down menu for iOS. "

  s.description  = <<-DESC
                   Stylish drop down menu for iOS. 
                   A Menu can be displayed from a navigation bar button item, in fullscreen or in a popover.
                   DESC

  s.homepage     = "https://github.com/eternityz/RWDropdownMenu"

  s.license      = "MIT"
  
  s.author             = { "eternityz" => "id@zhangbin.cc" }
  s.social_media_url   = "http://twitter.com/eternity1st"

  s.platform     = :ios, "7.0"

  s.ios.deployment_target = "7.0"

  s.source       = { :git => "https://github.com/eternityz/RWDropdownMenu.git", :tag => "1.0.1" }

  s.source_files  = "RWDropdownMenu", "RWDropdownMenu/**/*.{h,m}"

  s.requires_arc = true

end
