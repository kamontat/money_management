#!/usr/bin/env bash

set -e

# shellcheck disable=SC1091
source "$(dirname "$0")/_utils.sh"

_prepare_force

_flutter clean
