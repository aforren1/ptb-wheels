#!/bin/bash

set -exo pipefail

python -c "import psychtoolbox as ptb; print(ptb.GetSecs())"
