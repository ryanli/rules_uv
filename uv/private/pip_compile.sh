#!/usr/bin/env bash

set -euo pipefail

# inputs from Bazel
REQUIREMENTS_IN="{{requirements_in}}"
REQUIREMENTS_TXT="{{requirements_txt}}"
CONSTRAINTS_TXT="{{constraints_txt}}"

CONSTRAINT_ARGS=()
if [[ -n "${CONSTRAINTS_TXT}" ]]; then
  CONSTRAINT_ARGS+=(--constraint="${CONSTRAINTS_TXT}")
fi

{{uv}} pip compile \
    {{args}} \
    "${CONSTRAINT_ARGS[@]}" \
    --output-file="$REQUIREMENTS_TXT" \
    "$REQUIREMENTS_IN" \
    "$@"
