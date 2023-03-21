

git clone https://github.com/danielkucera/epaper-station src/epaper-station

git clone https://github.com/atc1441/ZBS_Flasher/ src/zbs_flasher
cp src/zbs_flasher/custom-firmware/firmware_ch11_low_power src/firmware_eink_atc1441_ch11_low_power -r
rm src/zbs_flasher -Rf

# cd src
# wget http://dmitry.gr/images/einkTags_0002_8051.zip
# unzip einkTags_0002_8051.zip
# rm firmware_eink_dmitry -R
# mv firmware firmware_eink_dmitry
# rm einkTags_0002_8051.zip
# cd ../

git clone https://github.com/atc1441/ZBS_Flasher src/firmware_flasher

echo "[env:nodemcu-32s]
platform = espressif32@5.0.0
board = nodemcu-32s
framework = arduino" > src/firmware_flasher/ESP32_Flasher/platformio.ini

sed -i 's/SDCC\\bin\\sdcc/sdcc/' src/firmware_eink_atc1441_ch11_low_power/cpu/8051/make.mk 

echo "done"