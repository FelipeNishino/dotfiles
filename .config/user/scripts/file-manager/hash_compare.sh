IFS=$(echo -en "\n\b")

declare -A hashfunction
hashfunction=([program]=sha256sum [name]="SHA256")

compute_hash() {
    echo "$(${hashfunction[program]} $1 | cut -d' ' -f 1)"
}

notify() {
    notify-send "hash_compare ${hashfunction[name]}" $1
}

main() {
    if [ "$#" -lt 2 ]; then
        if [ "$#" -lt 1 ]; then
            echo 'Please provide a file.'
            return 1
        else
            notify $(compute_hash $1)
            return 0
        fi
    fi

    declare -A hashes
    for file in $@; do
        hash=$(compute_hash $file)
        hashes[$hash]=1
    done

    if [ ${#hashes[@]} -eq 1 ];then
        notify "File hashes match!"
    else 
        notify "File hashes do not match!"
    fi
}

main "$@"
