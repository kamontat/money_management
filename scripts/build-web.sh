#!/usr/bin/env bash

set -e

# shellcheck disable=SC1091
source "$(dirname "$0")/_utils.sh"

_prepare

_flutter build web \
  --wasm \
  --source-maps \
  --optimization-level 4 \
  --pwa-strategy offline-first

_exec cp -r "$_BUILD_WEB_PATH" \
  "$_TARGET_WEB_PATH/.."
