#!/bin/bash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors!
. ~/.dwm/bar/themes/uwu

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c$darkblue^^b$black^ \uf2db "
  printf "^c$darkblue^^b$black^$cpu_val"
}

battery() {
  get_capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
  printf "^c$blue^   $get_capacity"
}

mem() {
  printf "^c$pink^^b$black^\uf538 "
  printf "^c$pink^$(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

network() {
  [ -n "$(nmcli -a | grep 'Wired connection')" ] && CONNAME="wired:"
  [ -n "$(nmcli -t -f active,ssid dev wifi | grep '^yes')" ] && CONNAME="wifi:"
  PRIVATE=$(nmcli -a | grep 'inet4' | awk '{print $2}')

  if [ "$CONNAME" = "" ]; then # we don't have a connection
    printf "^c$blue^^b$black^\ue1da^d^%s" " ^c$blue^^b$black^\Disconnected"
  else # we have a connection
	if [ "$CONNAME" = "wired:" ]; then
    printf "^c$blue^^b$black^\uf796^d^%s" "^c$blue^^b$black^ ${PRIVATE}"
else
    printf "^c$blue^^b$black^\ue1d8^d^%s" "^c$blue^^b$black^ ${PRIVATE}"
	fi
  fi
}

clock() {
  #printf "^c$black^ ^b$purple^ 󱑆 "
  printf "^c$black^^b$purple^ $(date '+%a, %H:%M') "
}

while true; do
  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && interval=$((interval + 1))

  sleep 1 && xsetroot -name "$(cpu) $(mem) $(network) $(clock)"
done
