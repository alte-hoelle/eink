#!/bin/bash
if [ $1 ]; then
  DISPLAY_SIZE=$1
else
  echo 'please provide display size [2.9, 1.54]'
  echo 'example: "./flash_display.sh 2.9"'
  DISPLAY_SIZE="2.9"
fi

if [ $2 ]; then
  MAC=$2
else
  echo "using default tty /dev/ttyUSB0, for other tty add to command -> './flash_tasmota.sh tasmota32-DE /dev/ttyACM0'"
  MAC=/dev/ttyUSB0
fi

BINARY="binary/eink/firmware_${DISPLAY_SIZE}_selfbuild.bin"

sudo python build/ZBS_Flasher/zbs_flasher.py /dev/ttyUSB0 write $BINARY
sudo python build/ZBS_Flasher/zbs_flasher.py /dev/ttyUSB0 MAC $MAC
