#!/bin/bash

yum install -y sysstat git gdb /usr/bin/debuginfo-install wget curl
debuginfo-install -y glibc java-11-openjdk
cd ~
wget https://github.com/async-profiler/async-profiler/releases/download/v3.0/async-profiler-3.0-linux-x64.tar.gz
tar -zxvf async-profiler-3.0-linux-x64.tar.gz
curl -L https://arthas.aliyun.com/install.sh | sh

git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >>~/.gdbinit
echo "DONE! debug your program with gdb and enjoy"

git clone https://github.com/scwuaptx/Pwngdb.git
cp ~/Pwngdb/.gdbinit ~/