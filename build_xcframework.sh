xcodebuild -project Pods/Pods.xcodeproj archive \
  -scheme PINCache \
  -sdk iphonesimulator \
  -archivePath "Archives/ios_simulators.xcarchive" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO

 xcodebuild -project Pods/Pods.xcodeproj archive \
  -scheme PINOperation \
  -sdk iphonesimulator \
  -archivePath "Archives/ios_simulators.xcarchive" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO

 xcodebuild -project Pods/Pods.xcodeproj archive \
  -scheme PINRemoteImage \
  -sdk iphonesimulator \
  -archivePath "Archives/ios_simulators.xcarchive" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO

xcodebuild -project Pods/Pods.xcodeproj archive \
  -scheme Texture \
  -sdk iphonesimulator \
  -archivePath "Archives/ios_simulators.xcarchive" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO

xcodebuild -project Pods/Pods.xcodeproj archive \
  -scheme PINCache \
  -sdk iphoneos \
  -archivePath "Archives/ios_devices.xcarchive" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO

 xcodebuild -project Pods/Pods.xcodeproj archive \
  -scheme PINOperation \
  -sdk iphoneos \
  -archivePath "Archives/ios_devices.xcarchive" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO

 xcodebuild -project Pods/Pods.xcodeproj archive \
  -scheme PINRemoteImage \
  -sdk iphoneos \
  -archivePath "Archives/ios_devices.xcarchive" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO
  
xcodebuild -project Pods/Pods.xcodeproj archive \
  -scheme Texture \
  -sdk iphoneos \
  -archivePath "Archives/ios_devices.xcarchive" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO

xcodebuild -create-xcframework \
  -framework Archives/ios_devices.xcarchive/Products/Library/Frameworks/PINCache.framework \
  -framework Archives/ios_simulators.xcarchive/Products/Library/Frameworks/PINCache.framework \
  -output Frameworks/PINCache.xcframework

xcodebuild -create-xcframework \
  -framework Archives/ios_devices.xcarchive/Products/Library/Frameworks/PINOperation.framework \
  -framework Archives/ios_simulators.xcarchive/Products/Library/Frameworks/PINOperation.framework \
  -output Frameworks/PINOperation.xcframework

xcodebuild -create-xcframework \
  -framework Archives/ios_devices.xcarchive/Products/Library/Frameworks/PINRemoteImage.framework \
  -framework Archives/ios_simulators.xcarchive/Products/Library/Frameworks/PINRemoteImage.framework \
  -output Frameworks/PINRemoteImage.xcframework

xcodebuild -create-xcframework \
  -framework Archives/ios_devices.xcarchive/Products/Library/Frameworks/AsyncDisplayKit.framework \
  -framework Archives/ios_simulators.xcarchive/Products/Library/Frameworks/AsyncDisplayKit.framework \
  -output Frameworks/AsyncDisplayKit.xcframework
