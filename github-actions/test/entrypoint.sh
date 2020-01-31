#! /usr/bin/env bash
set -euxo pipefail

pwd
ls -R /github/workspace
ls -R /github/home
ls -R /github/workflow

cat /github/workflow/event.json

if [ -z "$@" ]; then
    clojure -A:test
else
    $@
fi
