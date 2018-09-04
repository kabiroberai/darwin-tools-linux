#!/bin/bash
base="$(basename $0)"
tool="${base##*-}"

if type "${tool}" >/dev/null 2>&1; then
	:
elif type "${tool}-8" >/dev/null 2>&1; then
	tool="${tool}-8"
elif type "${tool}-7" >/dev/null 2>&1; then
	tool="${tool}-7"
elif type "${tool}-6.0" >/dev/null 2>&1; then
	tool="${tool}-6.0"
else
	echo "Could not find clang 6.0 or later in PATH."
	exit 1
fi

"${tool}" -target "$(readlink -f "$(dirname "$0")")/${base%-*}" "$@"
