#!/usr/bin/env python

import psychtoolbox as ptb
import pprint

t = ptb.GetSecs()
assert t > 0, t

from psychtoolbox import audio  # noqa: F401

pprint.pprint(audio.get_devices())
assert audio.get_devices()
