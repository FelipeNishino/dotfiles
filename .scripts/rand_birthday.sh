#!/bin/bash

y=$(date '+%Y')
my=$(($y - 19))
My=$(($my - 41))
./rand_date.sh 1 1 $My $my

