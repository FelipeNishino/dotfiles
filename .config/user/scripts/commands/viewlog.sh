#!/bin/sh

viewlog_main() {
    viewlog_logfile="${1? Missing log file}"
    cat "$viewlog_logfile" | less
}

viewlog_main "$@"
