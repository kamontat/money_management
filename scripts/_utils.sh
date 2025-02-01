#!/usr/bin/env bash

set -e

_ORIG_PATH="$PWD"

cd "$(dirname "$0")/.."

_ROOT_PATH="$PWD"
_SCRIPT_PATH="$_ROOT_PATH/scripts"

export _ORIG_PATH _ROOT_PATH _SCRIPT_PATH

_BUILD_PATH="$_ROOT_PATH/build"
_BUILD_IOS_PATH="$_BUILD_PATH/ios"
_BUILD_ANDROID_PATH="$_BUILD_PATH/app"
_BUILD_MACOS_PATH="$_BUILD_PATH/macos"
_BUILD_WINDOWS_PATH="$_BUILD_PATH/windows"
_BUILD_WEB_PATH="$_BUILD_PATH/web"

export _BUILD_PATH _BUILD_IOS_PATH _BUILD_ANDROID_PATH
export _BUILD_MACOS_PATH _BUILD_WINDOWS_PATH _BUILD_WEB_PATH

_TARGET_PATH="$_ROOT_PATH/target"
_TARGET_IOS_PATH="$_TARGET_PATH/ios"
_TARGET_ANDROID_PATH="$_TARGET_PATH/android"
_TARGET_MACOS_PATH="$_TARGET_PATH/macos"
_TARGET_WINDOWS_PATH="$_TARGET_PATH/windows"
_TARGET_WEB_PATH="$_TARGET_PATH/web"

export _TARGET_PATH _TARGET_IOS_PATH _TARGET_ANDROID_PATH
export _TARGET_MACOS_PATH _TARGET_WINDOWS_PATH _TARGET_WEB_PATH

_prepare() {
  __mkdir "$_TARGET_IOS_PATH"
  __mkdir "$_TARGET_ANDROID_PATH"
  __mkdir "$_TARGET_MACOS_PATH"
  __mkdir "$_TARGET_WINDOWS_PATH"
  __mkdir "$_TARGET_WEB_PATH"
}

_prepare_force() {
  __rmdir "$_TARGET_IOS_PATH"
  __rmdir "$_TARGET_ANDROID_PATH"
  __rmdir "$_TARGET_MACOS_PATH"
  __rmdir "$_TARGET_WINDOWS_PATH"
  __rmdir "$_TARGET_WEB_PATH"

  __mkdir "$_TARGET_IOS_PATH"
  __mkdir "$_TARGET_ANDROID_PATH"
  __mkdir "$_TARGET_MACOS_PATH"
  __mkdir "$_TARGET_WINDOWS_PATH"
  __mkdir "$_TARGET_WEB_PATH"
}

_flutter() {
  _exec flutter "$@"
}

_exec() {
  local input="$1" cmd args=()
  cmd="$(command -v "$input")"
  shift
  args=("$@")

  if [ -z "$cmd" ]; then
    printf 'command "%s" not found\n' "$input" >&2
    return 1
  fi

  printf '[INF] $ %s %s\n' "$cmd" "${args[*]}" >&2
  "$cmd" "${args[@]}"
}

__rmdir() {
  if [ -d "$1" ]; then
    rm -r "$1"
  fi
}

__mkdir() {
  if ! [ -d "$1" ]; then
    mkdir -p "$1"
  fi
}
