#!/bin/bash

set -exo pipefail

yum install -y pulseaudio pulseaudio-utils alsa-utils
sudo modprobe snd-dummy || true
pulseaudio --start
pactl list
aplay -L
