#!/bin/bash

set -e

function getEnv() {
  # Default values
  BUILD_ENV="";

  ARGS=( "$@" )

  for i in "${!ARGS[@]}"; do
    case "${ARGS[i]}" in
      '')continue;;
      --debug)
        if [[ $BUILD_ENV == "" ]]; then
          BUILD_ENV="--debug";
        else
          echo "You cannot set multiple build methods at once";
          exit 1;
        fi
      ;;
      --release)
        if [[ $BUILD_ENV == "" ]]; then
          BUILD_ENV="--release";
        else
          echo "You cannot set multiple build methods at once";
          exit 1;
        fi
      ;;
      --profile)
        if [[ $BUILD_ENV == "" ]]; then
          BUILD_ENV="--profile";
        else
          echo "You cannot set multiple build methods at once";
          exit 1;
        fi
      ;;
      # End of arguments
      --)unset 'ARGS[i]';break;;
    esac
    unset 'ARGS[i]'
  done

  if [[ $BUILD_ENV != "" ]]; then
    echo "$BUILD_ENV";
  fi
}

function getFlutter() {
  # Default values
  FLUTTER_PATH="flutter";

  ARGS=( "$@" )

  for i in "${!ARGS[@]}"; do
    case "${ARGS[i]}" in
      '')continue;;
      --flutter-path) FLUTTER_PATH="${ARGS[i+1]}";;
      # End of arguments
      --)unset 'ARGS[i]';break;;
    esac
    unset 'ARGS[i]'
  done

  echo "$FLUTTER_PATH";
}