apt install build-essential:native dh-sequence-python3 python3-all
git clone https://github.com/xen0l/aws-gate .
dh_make --python --createorig --packagename aws-gate_0.11.3 --yes
