#!/bin/bash

set -exo pipefail

yum install -y pulseaudio-utils
pulseaudio --start
pactl list
