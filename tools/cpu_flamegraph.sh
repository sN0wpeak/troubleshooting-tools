#!/bin/bash

mkdir -p /tmp/profile/cpu
./bin/asprof start  -e cpu  --loop 30 -f '/tmp/profile/cpu/cpu_profile_%t.html' jps