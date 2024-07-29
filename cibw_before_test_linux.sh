#!/bin/bash

set -exo pipefail

yum install -y pulseaudio pulseaudio-utils alsa-utils
modprobe snd-dummy
pulseaudio --start
pactl list
aplay -L || true
