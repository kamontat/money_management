#!/usr/bin/env bash

set -e

# shellcheck disable=SC1091
source "$(dirname "$0")/_utils.sh"

_prepare

_flutter build appbundle

RELEASE_LIB="$_BUILD_ANDROID_PATH/intermediates/merged_native_libs/release/out/lib"
RELEASE_LIB_NAME="target.zip"

_exec cp "$_BUILD_ANDROID_PATH/outputs/bundle/release/app-release.aab" \
  "$_TARGET_ANDROID_PATH"

pushd "$RELEASE_LIB"
_exec zip -r "$RELEASE_LIB_NAME" .
popd

_exec mv "$RELEASE_LIB/$RELEASE_LIB_NAME" "$_TARGET_ANDROID_PATH"
