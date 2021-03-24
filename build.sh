#!/bin/zsh

bundle install --path vendor/bundle
bundle exec pod install --verbose

rm -rf Frameworks/ Archives

for scheme in GTMAppAuth AppAuth GTMSessionFetcher PINCache PINOperation PINRemoteImage Texture 
do
  xcodebuild -project Pods/Pods.xcodeproj archive \
  -scheme $scheme \
  -sdk iphonesimulator \
  -archivePath "Archives/ios_simulators.xcarchive" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO

  xcodebuild -project Pods/Pods.xcodeproj archive \
  -scheme $scheme \
  -sdk iphoneos \
  -archivePath "Archives/ios_devices.xcarchive" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO

  xcodebuild -create-xcframework \
  -framework Archives/ios_devices.xcarchive/Products/Library/Frameworks/$scheme.framework \
  -framework Archives/ios_simulators.xcarchive/Products/Library/Frameworks/$scheme.framework \
  -output Frameworks/$scheme.xcframework
done
