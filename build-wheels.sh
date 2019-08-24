#!/bin/bash
set -e -x

# Install a system package required by our library
#yum install -y atlas-devel
git --git-dir=/ptb/.git submodule update --init --recursive

# Compile wheels
for PYBIN in /opt/python/*/bin; do
    "${PYBIN}/pip" wheel /ptb/psychtoolbox-3/ -w wheelhouse/
done

# Bundle external shared libraries into the wheels
for whl in wheelhouse/*.whl; do
    auditwheel repair "$whl" --plat $PLAT -w /ptb/wheelhouse/
done

# Install packages and test
for PYBIN in /opt/python/*/bin/; do
    "${PYBIN}/pip" install psychtoolbox --no-index -f /ptb/wheelhouse
    #(cd "$HOME"; "${PYBIN}/nosetests" pymanylinuxdemo)
done
