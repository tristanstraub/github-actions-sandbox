#! /usr/bin/env bash
pwd
ls /github/workspace
ls /github/home
ls /github/workflow

if [ -z "$@" ]; then
    clojure -A:test
else
    $@
fi
