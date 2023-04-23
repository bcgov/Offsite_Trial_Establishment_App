

set -e

source env_reader.bash
FLUTTER_PATH=$(getFlutter "$@")
BUILD_ENV=$(getEnv "$@")
if [[ $BUILD_ENV == "" ]]; then
  BUILD_ENV="--debug"
fi

/bin/bash init.bash "$FLUTTER_PATH"
/bin/bash setup_keystore.bash "$@"

$FLUTTER_PATH run $BUILD_ENV
