#!/usr/bin/env bash

set +euxo pipefail

## Debugging.
gpg --list-secret-keys

# Clone into current dir. The current dir is already non-empty
# so I have to work around git's refusal.
git clone https://github.com/xen0l/aws-gate
mv aws-gate/* aws-gate/.* .
rm -rf aws-gate/

# Make a debian metadata folder.
# The email and full name need to match the GPG key in the repo secret.
DEBFULLNAME="Iain Elder" dh_make --python --createorig --packagename aws-gate_0.11.3 --email iain@isme.es --yes

# Set the distribution so that debuild signs the changes file.
# At best dput will fail loudly. At worst it appears to work but Launchpad never gives email feedback.
# https://help.launchpad.net/Packaging/UploadErrors
sed -i 's/UNRELEASED/noble/' debian/changelog

# Install the build dependencies.
sudo apt install build-essential:native dh-sequence-python3 python3-all
