#!/bin/sh

lsdrv_main () {
    lsblk -o 'name,label,size,fsuse%,fstype,mountpoint,hotplug,model,parttypename'
}

lsdrv_main
