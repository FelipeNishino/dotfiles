IFS=$(echo -en "\n\b")

for file in $@; do
    base=$(basename $file)
    dir="${file%.*}"
    
    case "${file##*.}" in
        zip) unzip $file -d$dir
            ;;
    
        rar) mkdir $dir; unrar x $file $dir
            ;;

        7z) 7z x $file -o\*
            ;;
    esac
    notify-send 'Extraction Complete' "Extracted $base to $dir"

done
