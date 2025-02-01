#!/usr/bin/env bash

set -e

# shellcheck disable=SC1091
source "$(dirname "$0")/_utils.sh"

NAME="YAMM.app"

_prepare

_flutter build macos \
  --obfuscate \
  --split-debug-info "$_TARGET_MACOS_PATH/symbols"

_exec cp -r "$_BUILD_MACOS_PATH/Build/Products/Release/$NAME" \
  "$_TARGET_MACOS_PATH/$NAME"
