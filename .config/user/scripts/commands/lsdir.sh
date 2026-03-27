#!/bin/sh

termcolor_blue='\033[0;34m'

lsdir_main() {
    for lsdir_file in "$PWD"/*; do
        test -d "$lsdir_file" && printf "%b\n" "$termcolor_blue$(basename "$lsdir_file")"
    done
}

lsdir_main "$@"
