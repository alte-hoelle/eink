

if ! which sdcc &> /dev/null
then
    echo "sdcc could not be found, pls install the package"
    exit
fi

build () {
    mkdir -p binary/$1
    cd src/$1
    make clean
    make BUILD=$2 CPU=8051 SOC=zbs243
    cp main.bin ../../binary/$1/$3
    make clean
    cd ../..
}

# build firmware_eink_dmitry zbs29v026 firmware_2.9_selfbuild
build firmware_eink_atc1441_ch11_low_power zbs29v033 firmware_2.9_selfbuild.bin
build firmware_eink_atc1441_ch11_low_power zbs42v033 firmware_4.2_selfbuild.bin
build firmware_eink_atc1441_ch11_low_power zbs154v033 firmware_1.54_selfbuild.bin