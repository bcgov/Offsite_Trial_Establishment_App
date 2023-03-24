#!/bin/bash

set -e

# Default values
KEYSTORE_PROPERTIES="";
KEYSTORE_PATH="keystore.jks";
STORE_PASSWORD="some_password";
KEY_ALIAS="android";
KEY_PASSWORD="some_password";
HAS_KEYSTORE_PARAMS="false";

ARGS=( "$@" )

for i in "${!ARGS[@]}"; do
  case "${ARGS[i]}" in
    '')continue;;
    --keystore-properties)
      if [[ $HAS_KEYSTORE_PARAMS == "false" ]]; then
      KEYSTORE_PROPERTIES=${ARGS[i+1]};
      else
      echo "You cannot set the value of keystore-properties and one of the following values at the same time: keystore-path, store-password, key-alias, key-password because they conflict with each other"
      exit 1
      fi
    ;;
    --keystore-path)
      if [[ $KEYSTORE_PROPERTIES == "" ]]; then
      KEYSTORE_PATH="${ARGS[i+1]}";
      HAS_KEYSTORE_PARAMS="true";
      else
      echo "You cannot set the value of keystore-properties and one of the following values at the same time: keystore-path, store-password, key-alias, key-password because they conflict with each other"
      exit 1
      fi
    ;;
    --store-password)
      if [[ $KEYSTORE_PROPERTIES == "" ]]; then
      STORE_PASSWORD="${ARGS[i+1]}";
      HAS_KEYSTORE_PARAMS="true";
      else
      echo "You cannot set the value of keystore-properties and one of the following values at the same time: keystore-path, store-password, key-alias, key-password because they conflict with each other"
      exit 1
      fi
    ;;
    --key-alias)
      if [[ $KEYSTORE_PROPERTIES == "" ]]; then
      KEY_ALIAS="${ARGS[i+1]}";
      HAS_KEYSTORE_PARAMS="true";
      else
      echo "You cannot set the value of keystore-properties and one of the following values at the same time: keystore-path, store-password, key-alias, key-password because they conflict with each other"
      exit 1
      fi
    ;;
    --key-password)
      if [[ $KEYSTORE_PROPERTIES == "" ]]; then
      KEY_PASSWORD="${ARGS[i+1]}";
      HAS_KEYSTORE_PARAMS="true";
      else
      echo "You cannot set the value of keystore-properties and one of the following values at the same time: keystore-path, store-password, key-alias, key-password because they conflict with each other"
      exit 1
      fi
    ;;
    # End of arguments
    --)unset 'ARGS[i]';break;;
  esac
  unset 'ARGS[i]'
done

if [[ $KEYSTORE_PROPERTIES == "" ]]; then
  echo "storePassword=$STORE_PASSWORD" > "android/keystore.properties";
  echo "keyAlias=$KEY_ALIAS" >> "android/keystore.properties";
  echo "keyPassword=$KEY_PASSWORD" >> "android/keystore.properties";
  echo "storeFile=$KEYSTORE_PATH" >> "android/keystore.properties";
else
  cp "$KEYSTORE_PROPERTIES" "android/keystore.properties";
fi