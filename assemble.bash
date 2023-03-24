#!/bin/bash

set -e

# Default values
FLUTTER_PATH="flutter";
IOS_BUILD="false";
ANDROID_BUILD="false";
ANDROID_TYPE="appbundle";
SETUP_KEYSTORE="true";

source env_reader.bash
FLUTTER_PATH=$(getFlutter "$@")
BUILD_ENV=$(getEnv "$@")
if [[ $BUILD_ENV == "" ]]; then
  BUILD_ENV="--release"
fi

ARGS=( "$@" )

for i in "${!ARGS[@]}"; do
  case "${ARGS[i]}" in
    '')continue;;
    --no-setup-keystore) SETUP_KEYSTORE="false";;
    --ios) IOS_BUILD="true";;
    --android)
      ANDROID_BUILD="true"
      if [[ ${ARGS[i+1]} == "apk" ]]; then
        ANDROID_TYPE="apk";
      fi
    ;;
    # End of arguments
    --)unset 'ARGS[i]';break;;
  esac
  unset 'ARGS[i]'
done

if [[ $IOS_BUILD == "false" ]] && [[ $ANDROID_BUILD == "false" ]]; then
  IOS_BUILD="true";
  ANDROID_BUILD="true";
fi

/bin/bash init.bash "$FLUTTER_PATH"

if [[ $ANDROID_BUILD == "true" ]]; then
  if [[ $BUILD_ENV != "--debug" ]] && [[ $SETUP_KEYSTORE == "true" ]]; then
    /bin/bash setup_keystore.bash "$@"
  fi
  $FLUTTER_PATH build $ANDROID_TYPE $BUILD_ENV
  if [[ $ANDROID_TYPE == "apk" ]]; then
    open build/app/outputs/flutter-apk
  else
    open build/app/outputs/bundle
  fi
fi

if [[ $IOS_BUILD == "true" ]]; then
  $FLUTTER_PATH build ipa $BUILD_ENV
  open build/ios/ipa
fi