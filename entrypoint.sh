#! /usr/bin/env bash
set -euxo pipefail

pwd
ls /github/workspace
ls /github/home
ls /github/workflow

cat /github/home/event.json

if [ -z "$@" ]; then
    clojure -A:test
else
    $@
fi
