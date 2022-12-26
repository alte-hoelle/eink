if ! which pio &> /dev/null
then
    echo "platform-io could not be found, pls install the package"
    exit
fi
mkdir -p binary/esp

FLASHER_PATH=src/firmware_flasher/ESP32_Flasher

cd $FLASHER_PATH

if ! pio run
then
    echo "pio build aborted"
    exit
fi

cd ../../..

cp ${FLASHER_PATH}/.pio/build/nodemcu-32s/firmware.bin binary/esp/esp32s-firmware.bin
cp ${FLASHER_PATH}/.pio/build/nodemcu/firmware.bin binary/esp/esp8266-firmware.bin