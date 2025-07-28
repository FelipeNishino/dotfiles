#!/bin/sh
function abort() {
    echo "<Abort>: ${@}"
    exit 1
}

function check_file() {
    if [ -z "$1" ]; then
        return 1
    fi
    if [ -e "$1" ]; then
        return 0
    else
        echo "Not found:<$1>"
        return 1
    fi
}

function main() {
    afproflist="./afproflist.txt"
    updater="./updater.sh"
    afprofs=$(cat $afproflist)

    check_file $updater && \
    for afprof in $afprofs
    do
        cleaner="./$afprof/prefsCleaner.sh"
        check_file $cleaner && \
        $updater -u -s -p "./$afprof" && $cleaner -s
    done
}

main "$@"
