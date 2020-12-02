#! /bin/sh

echo "$(brightnessctl -m | cut -d ',' -f 4 | sed -e 's/%//')"
