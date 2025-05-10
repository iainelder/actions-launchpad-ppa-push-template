#!/usr/bin/env bash

set +euxo pipefail

# Clone into current dir. The current dir is already non-empty
# so I have to work around git's refusal.
git clone https://github.com/xen0l/aws-gate
mv aws-gate/* aws-gate/.* .
rm -rf aws-gate/

# Make a debian metadata folder.
dh_make --python --createorig --packagename aws-gate_0.11.3 --yes

# Install the build dependencies.
sudo apt install build-essential:native dh-sequence-python3 python3-all
