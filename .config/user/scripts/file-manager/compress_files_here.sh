IFS=$(echo -en "\n\b")

main() {
    declare -a archives
    declare -a files

    for file in $@; do
        files+=("$(basename $file)")
    done

    7z a "$1.7z" ${files[@]}
    archives+=("$1.7z")
    zip -9r "$1.zip" ${files[@]}
    archives+=("$1.zip")
    tar -cj -f "$1.tar.bz2" ${files[@]} 
    archives+=("$1.tar.bz2")
    tar -cJ -f "$1.tar.xz" ${files[@]} 
    archives+=("$1.tar.xz")
    tar -cz -f "$1.tar.gz" ${files[@]} 
    archives+=("$1.tar.gz")
    tar -c --zstd -f "$1.tar.zst" ${files[@]} 
    archives+=("$1.tar.zst")

    declare -A lowest
    SInt64=$(((2**63)-1))
    lowest=([name]="" [size]=$SInt64)

    for i in "${!archives[@]}"; do
        size=$(ls -s ${archives[$i]} | cut -d' ' -f 1)
        if [ $size -lt ${lowest[size]} ]; then
            lowest[name]=${archives[$i]}
            lowest[size]=$size
        fi
    done

    for archive in "${archives[@]}"; do
        if [ $archive != ${lowest[name]} ]; then
            rm $archive
        fi
    done
}

main "$@"
