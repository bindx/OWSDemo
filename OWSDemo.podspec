#
#  Be sure to run `pod spec lint OWSDemo.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "OWSDemo"
  s.version      = "1.0"
  s.summary      = "OWSDEMO"

  s.description  = <<-DESC
                   A longer description of OWSDemo in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "https://github.com/bindx/OWSDemo"
  s.license      = "MIT (example)"
  s.author             = { "bindx" => "email@address.com" }
  s.source       = { :git => "https://github.com/bindx/OWSDemo.git", :tag => "1.0" }

  s.framework = 'StoreKit','AdSupport','SystemConfiguration','CoreLocation'

  s.source_files  = "Lib", "/Lib/include/BindxOWS/.h"
  s.vendored_libraries = 'Lib/*.{a,bundle}'

  #  s.exclude_files = "Classes/Exclude"

end
