#!/bin/bash

set -x

which cpulimit || brew install cpulimit

sudo -s -- <<'EOF'
for process in TaniumCX TaniumClient TaniumEndpointIndex trapsd
do
    pgrep $process | xargs -I X sudo cpulimit -l 0 -p X &
done
EOF
