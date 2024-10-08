#!/bin/bash
set -exo pipefail

if [ ! -d "portaudio/" ]; # check if we've run this already
then
    # Install system packages required by psychtoolbox
    yum install -y libusb1-devel libXi-devel alsa-lib-devel jack-audio-connection-kit-devel

    # build portaudio manually (couldn't find PaAlsa_SetNumPeriods symbol in the system package)
    git clone https://github.com/portaudio/portaudio.git
    cd portaudio
    git checkout v19.7.0
    ./configure && make
    make install
    cd ..
fi
