#!/bin/bash
set -euxo pipefail
IFS=$'\n\t'

cd "$(cd "$(dirname "$0")" && pwd)"/..

git config user.name "Taiki Endo"
git config user.email "taiki@smilerobotics.com"

for formula in Formula/*.rb; do
    git add -N "${formula}"
    if ! git diff --exit-code -- "${formula}"; then
        name="$(basename "${formula%.*}")"
        version="$(grep <"${formula}" -E '^\s+version "' | sed -E 's/^\s+version "//' | sed 's/"$//')"
        git add "${formula}"
        git commit -m "Update ${name} to ${version}"
        has_update=1
    fi
done

if [[ -n "${has_update:-}" ]]; then
    echo 'success=false' >>"${GITHUB_OUTPUT}"
fi
