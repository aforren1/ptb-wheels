#!/bin/bash

if [ ! -d "libusb/" ];
then
    # build libusb manually, and target MacOS 11.0
    git clone https://github.com/libusb/libusb.git
    cd libusb
    git checkout v1.0.27
    bash ./autogen.sh && ./configure && make && make install
    cd ..
fi
