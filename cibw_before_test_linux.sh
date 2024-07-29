#!/bin/bash

set -exo pipefail

yum install -y pulseaudio pulseaudio-utils alsa-utils
pulseaudio --start
pactl list
modprobe snd-dummy
aplay -l
