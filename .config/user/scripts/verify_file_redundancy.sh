#!/bin/bash

vfr_abort() {
    echo "<$0>: $*"
    exit 1
}

vfr_check_arg() {
    if [ -z "$1" ]; then
        shift
        echo "$@"
        exit 1
    fi
}

vfr_check_extraneous_arg() {
    if [ -n "$1" ]; then
        vfr_abort "Extraneous argument <$1> provided"
    fi
}

declare -A hashfunction
hashfunction=([program]=sha256sum [name]="SHA256")

vfr_compute_hash() {
    echo "$(${hashfunction[program]} "$1" | cut -d' ' -f 1)"
}

vfr_is_number() {
    case $1 in
        '' | *[!0123456789]*)
            return 1
    esac
}

vfr_all_exact_filename() {
    for index in "${!1[@]}"; do
        if [ "$index" = 0 ]; then
            continue
        fi
        prev_index=$(("$index" - 1))

        if [ "${1[$index]}]" != "${1[$prev_index]}" ]; then
            return 1
        fi
    done
    return 0
}

vfr_dedup_files() {
    all_files="$1"
    declare -a files
    declare -a detailed_files

    while [ "$all_files" != "$iter" ] ;do
        # extract the substring from start of string up to delimiter.
        iter=${all_files%%//*}
        # delete this first "element" AND his separator, from $files.
        all_files="${all_files#$iter//}"
        # Print (or doing anything with) the first "element".
        #printf '> [%s]\n' "$iter"
        #detailed_files+=("$(ls --full-time "$iter" | awk '{for (i=9; i <= NF; i++){printf "%s ", $i}; print $6,$7}')")
        detailed_files+=("$(basename "$iter") $(ls --full-time "$iter" | awk '{print $6,$7}')")

        files+=("$iter")
    done 

    # Check if all duplicates have the same name
    for index in "${!files[@]}"; do
        if [ "$index" = 0 ]; then
            continue
        fi
        prev_index=$(("$index" - 1))

        name1=$(basename "${files[$index]}")
        name2=$(basename "${files[$prev_index]}")

        if [ "$name1" != "$name2" ]; then
            needs_attention=true
        fi
    done

    # Prompt user for each duplicate to decide which version to keep
    if [ "$needs_attention" ]; then
        echo "Found following duplicates. Choose which to keep(1-$hash_count):"
        select chosen_file in "${detailed_files[@]}"; do
            if vfr_is_number "$REPLY" && [ "$REPLY" -gt 0 ] && [ "$REPLY" -lt $(("${#detailed_files[@]}" + 1)) ]; then
                chosen_file_index=$(("$REPLY" - 1))
                break
            fi
        done
        unset needs_attention
    else
        # If no different names, keep the oldest
        unset -v chosen_file_index
        for i in "${!files[@]}"; do
            if [ -z "$chosen_file_index" ] || [ "${files[$i]}" -ot "${files[$chosen_file_index]}" ] ;then
                chosen_file_index="$i"
            fi
        done
    fi

    chosen_file="${files[$chosen_file_index]}"
    unset "detailed_files[$chosen_file_index]"
    unset "files[$chosen_file_index]"

    echo ""
    for file_to_del in "${files[@]}"; do
        echo rm "$file_to_del"
    done

    dest_file="$path_dest/$(basename "$chosen_file")"

    if [ "$chosen_file" != "$dest_file" ]; then
        echo mv "$chosen_file" "$dest_file"
    fi
    echo ""
}

# POSIX sh
vfr_spin() {
    sp='/-\|'
    printf ' '
    while sleep 1; do
        printf '\b%.1s' "$sp"
        sp=${sp#?}${sp%???}
    done
}

vfr_main() {
    vfr_check_extraneous_arg "$3"
    vfr_check_arg "$1" 'Please provide source directory.'
    vfr_check_arg "$2" 'Please provide destination directory.'

    # Converting relative paths to absolute as they will be used later for user confirmation
    path_source=$(cd "$1" || exit 1; pwd)
    path_dest=$(cd "$2" || exit 1; pwd)

    declare -A hashes
    declare -A hashes_count

    vfr_spin & spinpid=$!

    # Group files in directories supplied by calculated hash
    for dir in "$path_source" "$path_dest"; do
        for file in "$dir"/*; do
            if [ -d "$file" ]; then
                continue
            fi

            hash=$(vfr_compute_hash "$file")
            if [ -n "${hashes[$hash]}" ]; then
                hashes["$hash"]+="//$file"
            else
                hashes["$hash"]+="$file"
            fi

            if [ -n "${hashes_count[$hash]}" ]; then
                hashes_count["$hash"]=$(("${hashes_count[$hash]}" + 1))
            else
                hashes_count["$hash"]=1
            fi
        done
    done

    kill "$spinpid"
    # Check for duplicates by verifying which hashes have -gt 1 count
    for hash in "${!hashes[@]}"; do
        local hash_count=${hashes_count[$hash]} 
        if [ "$hash_count" -gt 1 ]; then
            vfr_dedup_files "${hashes[$hash]}"
        fi
    done
}

vfr_main "$@"
