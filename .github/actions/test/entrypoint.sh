#! /usr/bin/env bash
set -Euxo pipefail

pwd

[ -e /github/workspace ] && ls -R /github/workspace;
[ -e /github/home ] && ls -R /github/home
[ -e /github/workflow ] && ls -R /github/workflow
[ -e /github/workflow/event.json ] && cat /github/workflow/event.json;

if [ -z "$@" ]; then
    clojure -A:test
else
    $@
fi
