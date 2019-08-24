#!/bin/bash
set -e -x

# Install a system package required by our library
yum install -y libusb1-devel portaudio-devel libXi-devel alsa-lib-devel
git --git-dir=/ptb/.git submodule update --init --recursive

pyvs=(cp36-cp36m cp37-cp37m)
# Compile wheels
for PYBIN in "${pyvs[@]}"; do
    "/opt/python/${PYBIN}/bin/pip" install numpy
    "/opt/python/${PYBIN}/bin/pip" wheel /ptb/psychtoolbox-3/ -w wheelhouse/
done

# Bundle external shared libraries into the wheels
for whl in wheelhouse/*.whl; do
    auditwheel repair "$whl" --plat $PLAT -w /ptb/wheelhouse/
done

# Install packages and test
for PYBIN in "${pyvs[@]}"; do
    "/opt/python/${PYBIN}/bin/pip" install psychtoolbox --no-index -f /ptb/wheelhouse
    #(cd "$HOME"; "${PYBIN}/nosetests" pymanylinuxdemo)
done
