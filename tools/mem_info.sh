# 查看内存

PID=$1
jcmd $PID VM.native_memory
gdb -batch -p $PID -ex 'call malloc_stats()'

