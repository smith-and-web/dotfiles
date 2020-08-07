#!/bin/env sh

killall -q polybar

# Wait until the processes have been shut down
while pgrep -u jsmith -x polybar >/dev/null; do 
    sleep 1;
done

for m in $(polybar --list-monitors | cut -d":" -f1); do
  echo "Running bars on monitor $m"
  MONITOR=$m  polybar --reload i3 &
  MONITOR=$m  polybar --reload spotify &
  MONITOR=$m  polybar --reload util &
done
