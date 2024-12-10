#!/bin/bash

mkdir -p "~/infra_troubleshooting"
CPU_LOG="~/infra_troubleshooting/cpu_usage_$PID.log"
echo "CPU Usage Log" > "$CPU_LOG"

pidstat -duwhrt -p "$PID" 3 | while IFS= read -r line; do echo "$(date '+%Y-%m-%d %H:%M:%S') $line"; done > "$CPU_LOG"