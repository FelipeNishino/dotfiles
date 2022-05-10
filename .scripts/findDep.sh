for f in $(ls /bin); do
	if [ -n "$(ldd /bin/$f | grep "$1")" ]
	then
		echo "Found $1 in $f"
	fi
done
