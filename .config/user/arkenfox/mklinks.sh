#!/bin/sh

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
    profiledirs=$(ls -d */ | grep "\.af" | cut -f1 -d'/')

    for pdir in $profiledirs;
    do
        uov="/home/nishi/.config/user/arkenfox/$(echo $pdir | cut -f2 -d'.').user-overrides.js"
        updater="/home/nishi/.config/user/arkenfox/updater.sh"
        cleaner="/home/nishi/.config/user/arkenfox/prefsCleaner.sh"
        #check_file($uov) && ln -s $uov ./$pdir/user-overrides.js
        #check_file $uov && echo "created link for useroverride"
        #check_file $updater && echo "created link for updater"
        #check_file $cleaner && echo "created link for cleaner"
        check_file $uov && ln -s $uov ./$pdir/user-overrides.js
        #check_file $updater && ln -s $updater ./$pdir/updater.sh
        #check_file $cleaner && ln -s $cleaner ./$pdir/prefsCleaner.sh
    done
}

main "$@"
