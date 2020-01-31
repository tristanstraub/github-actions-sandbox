#! /usr/bin/env bash
if [ -z "$@" ]; then
    clojure -A:test
else
    $@
fi
