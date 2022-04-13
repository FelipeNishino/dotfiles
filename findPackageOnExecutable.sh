find / -name "*" -type f -executable -exec file {} \; | grep "$1"
