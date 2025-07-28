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
    case "$OSTYPE" in
        darwin*) ffdir="$HOME/Library/Application Support/Firefox/Profiles";;
        linux-gnu*) ffdir="$HOME/.mozilla/firefox";;
        *) abort "Couldn't match ostype, got <$OSTYPE>";;
    esac
    pdirs=$(ls -F "$ffdir" | grep "/$" | grep "\.af" | cut -f1 -d'/')
    afproflist="$ffdir/afproflist.txt"
    echo $pdirs > $afproflist
    afuserdir="$HOME/.config/user/arkenfox"
    uandc="$afuserdir/updateAndClean.sh"
    updater="$afuserdir/updater.sh"
    cleaner="$afuserdir/prefsCleaner.sh"
    for pdir in $pdirs;
    do
        uov="$afuserdir/$(echo $pdir | cut -f2 -d'.').user-overrides.js"
        #check_file($uov) && ln -s $uov ./$pdir/user-overrides.js
        #check_file $uov && echo "created link for useroverride"
        #check_file $updater && echo "created link for updater"
        #check_file $cleaner && cp $cleaner "$ffdir/$pdir/prefsCleaner.sh"
        check_file $cleaner && ln $cleaner "$ffdir/$pdir/prefsCleaner.sh"
        check_file $uov && ln -s $uov "$ffdir/$pdir/user-overrides.js"
    done
    check_file $updater && ln -s $updater "$ffdir/updater.sh"
    check_file $uandc && ln -s $uandc "$ffdir/updateAndClean.sh"
}

main "$@"
