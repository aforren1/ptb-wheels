#!/bin/bash
set -e -x

# Install system packages required by our library
yum install -y libusb1-devel libXi-devel alsa-lib-devel

# build portaudio manually (couldn't find PaAlsa_SetNumPeriods symbol in the system package)
git clone https://git.assembla.com/portaudio.git
cd portaudio
git checkout pa_stable_v190600_20161030
./configure && make
make install
cd ..

git --git-dir=/ptb/.git submodule update --init --recursive

pyvs=(cp36-cp36m cp37-cp37m)
# Compile wheels
for PYBIN in "${pyvs[@]}"; do
    "/opt/python/${PYBIN}/bin/pip" wheel /ptb/psychtoolbox-3/ -w wheelhouse/
done

# Bundle external shared libraries into the wheels
for whl in wheelhouse/*.whl; do
    auditwheel repair "$whl" --plat $PLAT -w /ptb/wheelhouse/
done

# Install packages and test
for PYBIN in "${pyvs[@]}"; do
    "/opt/python/${PYBIN}/bin/pip" install psychtoolbox --no-index -f /ptb/wheelhouse
    "/opt/python/${PYBIN}/bin/python" -c "import psychtoolbox as ptb; print(ptb.GetSecs())"
    "/opt/python/${PYBIN}/bin/python" -m psychtoolbox.demos.hidtest_pythonic
    "/opt/python/${PYBIN}/bin/python" -m psychtoolbox.demos.ppatest_pythonic
done
