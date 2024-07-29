#!/bin/bash

set -exo pipefail

yum install -y pulseaudio pulseaudio-utils
pulseaudio --start
pactl list
