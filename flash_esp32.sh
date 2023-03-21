#!/bin/bash


if ! python -m esptool -h &> /dev/null
then
    echo "esptool could not be found, pls install the package 'pip install esptool'"
    exit
fi
mkdir -p binary/esp

if [ $1 ]; then
  TTY=$1
else
  echo "using default tty /dev/ttyUSB0, for other tty add to command -> './flash_esp32.sh /dev/ttyACM0'"
  TTY=/dev/ttyUSB0
fi
# python -m esptool --chip esp32 --port $TTY  write_flash -z 0x1000 binary/esp/$1

FLASHER_PATH=src/firmware_flasher/ESP32_Flasher

cd $FLASHER_PATH
pio run -t upload --upload-port $TTY
cd ../../..
