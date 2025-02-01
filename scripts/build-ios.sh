#!/usr/bin/env bash

set -e

# shellcheck disable=SC1091
source "$(dirname "$0")/_utils.sh"

_prepare

_flutter build ipa \
  --obfuscate \
  --export-method development \
  --split-debug-info "$_TARGET_IOS_PATH/symbols"

_exec cp -r "$_BUILD_IOS_PATH/ipa" "$_TARGET_IOS_PATH/ipa"
