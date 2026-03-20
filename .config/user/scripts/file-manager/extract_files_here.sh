IFS=$(echo -en "\n\b")

for file in $@; do
    base=$(basename $file)
    
    case "${file##*.}" in
        zip) unzip $file
            ;;
    
        rar) unrar x $file
            ;;

        7z) 7z x $file
            ;;
    esac
    notify-send 'Extraction Complete' "Extracted $base to ./"
done
