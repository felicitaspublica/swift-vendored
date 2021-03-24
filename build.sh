#!/bin/zsh

bundle install --path vendor/bundle
bundle exec pod install --verbose

rm -rf Frameworks/ Archives

for scheme in GTMAppAuth AppAuth GTMSessionFetcher PINCache PINOperation PINRemoteImage Texture 
do

xcodebuild -project Pods/Pods.xcodeproj archive \
  -scheme ${scheme} \
  -sdk iphonesimulator \
  -archivePath "Archives/${scheme}/ios_simulators.xcarchive" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO


xcodebuild -project Pods/Pods.xcodeproj archive \
   -scheme $scheme \
   -sdk iphoneos \
   -archivePath "Archives/$scheme/ios_devices.xcarchive" \
   BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
   SKIP_INSTALL=NO
 
   archive="Archives/$scheme"
 
   if [ $scheme = "Texture" ]; then
     scheme="AsyncDisplayKit"
   fi 
 
   xcodebuild -create-xcframework \
    -framework $archive/ios_devices.xcarchive/Products/Library/Frameworks/$scheme.framework \
    -framework $archive/ios_simulators.xcarchive/Products/Library/Frameworks/$scheme.framework \
    -output Frameworks/$scheme.xcframework
done
