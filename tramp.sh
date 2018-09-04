#!/bin/bash
base="$(basename $0)"
"${0##*-}-8" -target "$(readlink -f "$(dirname "$0")")/${base%-*}" "$@"
