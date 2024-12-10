#!/bin/bash

mkdir -p /tmp/profile/malloc
./bin/asprof start  -e malloc  --loop 30 -f '/tmp/profile/malloc/malloc_profile_%t.html' jps