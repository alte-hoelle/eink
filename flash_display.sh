#!/bin/bash

EXAMPLE="./flash_display.sh binary/firmware_eink_atc1441_ch11_low_power/firmware_2.9_selfbuild.bin 000000000000AFFE /dev/ttyUSB0"

if ! [ $1 ]; then
  echo 'please provide path to binary'
  echo "example: $EXAMPLE"
  exit
fi

if [ $2 ]; then
  MAC=$2
else
  echo "using default MAC: 1234000012340000'"
  MAC="1234000012340000"
fi

if [ $3 ]; then
  TTY=$3
else
  echo "using default tty /dev/ttyUSB0"
  TTY=/dev/ttyUSB0
fi



sudo python src/firmware_flasher/zbs_flasher.py -p $TTY write $1
sleep 3
sudo python src/firmware_flasher/zbs_flasher.py -p $TTY mac -m $MAC
sleep 3
sudo python src/firmware_flasher/zbs_flasher.py -p $TTY reset
