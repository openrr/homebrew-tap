#!/usr/bin/env bash
set -eEuo pipefail
IFS=$'\n\t'
cd "$(dirname "$0")"/..

# Audit formulas.
#
# USAGE:
#    ./tools/audit.sh

tap_name=openrr/test
brew tap-new --no-git "${tap_name}"
cp Formula/*.rb "$(brew --repo "${tap_name}")"/Formula

if [[ -n "${CI:-}" ]]; then
    for formula in Formula/*.rb; do
        formula="$(basename "${formula%.*}")"
        brew uninstall "${tap_name}/${formula}"
    done
fi

for formula in Formula/*.rb; do
    formula="$(basename "${formula%.*}")"
    brew audit --strict "${tap_name}/${formula}"
done

brew untap "${tap_name}"
