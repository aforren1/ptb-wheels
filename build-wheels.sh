#!/bin/bash
set -e -x

# Install a system package required by our library
yum install -y libusb1-devel portaudio-devel libXi-devel alsa-lib-devel
git --git-dir=/ptb/.git submodule update --init --recursive

pyvs=(cp37-cp37m)
# Compile wheels
for PYBIN in "${pyvs[@]}"; do
    "/opt/python/${PYBIN}/bin/pip" install numpy
    "/opt/python/${PYBIN}/bin/pip" wheel /ptb/psychtoolbox-3/ -w wheelhouse/ -v
done

# Bundle external shared libraries into the wheels
for whl in wheelhouse/*.whl; do
    auditwheel repair "$whl" --plat $PLAT -w /ptb/wheelhouse/
done

# Install packages and test
for PYBIN in "${pyvs[@]}"; do
    "/opt/python/${PYBIN}/bin/pip" install psychtoolbox --no-index -f /ptb/wheelhouse
    ldd "/opt/python/cp37-cp37m/lib/python3.7/site-packages/psychtoolbox/PsychPortAudio.cpython-37m-x86_64-linux-gnu.so"
    "/opt/python/${PYBIN}/bin/python" -c "import psychtoolbox as ptb; print(ptb.GetSecs())"
    #(cd "$HOME"; "${PYBIN}/nosetests" pymanylinuxdemo)
done
