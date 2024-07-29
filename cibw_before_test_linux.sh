#!/bin/bash

set -exo pipefail

yum install -y pulseaudio pulseaudio-utils alsa-utils
pulseaudio --start --system
pactl list
aplay -l
