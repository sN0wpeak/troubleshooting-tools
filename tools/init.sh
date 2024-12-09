yum install -y sysstat git gdb /usr/bin/debuginfo-install

cd /usr/local/bin
curl -L https://arthas.aliyun.com/install.sh | sh


debuginfo-install glibc

git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
echo "DONE! debug your program with gdb and enjoy"

cd ~/
git clone https://github.com/scwuaptx/Pwngdb.git
cp ~/Pwngdb/.gdbinit ~/