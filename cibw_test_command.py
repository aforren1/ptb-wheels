#!/usr/bin/env python

import os
import pprint

import psychtoolbox as ptb

t = ptb.GetSecs()
assert t > 0, t

from psychtoolbox import audio  # noqa: F401

# Despite putting this in cibw_before_test_linux.sh:
#
# yum install -y pulseaudio pulseaudio-utils alsa-utils
# sudo modprobe snd-dummy || true
# pulseaudio --start
# pactl list
# aplay -L
#
# The CIBW Linux docker instance audio device is not avaialble.

if os.getenv("PTB_SOUND_TEST").lower() not in ("false", "0"):
    pprint.pprint(audio.get_devices())
    assert audio.get_devices()
