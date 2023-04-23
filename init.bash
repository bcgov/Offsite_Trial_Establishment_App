#!usr/bin/bash

set -e

${1:-flutter} doctor -v

rm -f pubspec.lock
${1:-flutter} clean
cd ios
rm -f Podfile.lock
rm -rf Pods
cd ../image_picker
rm -f pubspec.lock
${1:-flutter} clean
${1:-flutter} pub get
cd ..
${1:-flutter} pub get
${1:-flutter} pub run build_runner build --delete-conflicting-outputs
cd ios
pod install --repo-update
