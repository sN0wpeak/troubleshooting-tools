#!/bin/bash

# Arthas脚本路径
ARTHAS_SCRIPT_PATH="~/arthas/arthas_commands.as"
ARTHAS_CLIENT_PATH="/usr/local/bin/as.sh"

# 目标Java进程PID
PID=$1

# 输出目录
FLAMEGRAPH_DIR="~/arthas/flamegraphs"

mkdir -p "$FLAMEGRAPH_DIR"


while true; do
  TIMESTAMP=$(date +%Y%m%d_%H%M%S)
  FLAMEGRAPH_FILE="$FLAMEGRAPH_DIR/cpu_flamegraph_$PID_$TIMESTAMP.svg"

  # 生成 Arthas 脚本
  cat > "$ARTHAS_SCRIPT_PATH" <<EOF
profiler start --duration 30 --format svg --output $FLAMEGRAPH_FILE
EOF

  echo "Starting profiler at $(date)..."

  # 每秒采集 CPU 使用率
  for i in {1..30}; do
    CPU_USAGE=$(get_cpu_usage $PID)
    echo "$(date '+%Y-%m-%d %H:%M:%S') - CPU Usage: $CPU_USAGE%" >> "$CPU_LOG"
    sleep 1
  done

  # 执行 Arthas 脚本
  $ARTHAS_CLIENT_PATH -c $ARTHAS_SCRIPT_PATH $PID
  echo "Flame graph saved to $FLAMEGRAPH_FILE"
done
