while true; do
    xsetroot -name "$(date)"
    sleep 2
done &
nitrogen --restore &
xrandr -s 1920x1080 &
exec dwm
