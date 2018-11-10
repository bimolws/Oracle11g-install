Install Oracle 11g in Linux 7.x Step by step by Le Anh

Step 1: download oracle 11g in oracle website
http://www.oracle.com/technetwork/dat...
p10404530_112030_Linux-x86-64_1of7.zip
p10404530_112030_Linux-x86-64_2of7.zip

Step 2: configuring hostname
hostnamectl set-hostname cdrraw

Step 3: add in hosts file
#vi /etc/hosts
add the following lines
192.168.40.197 cdrraw
cdrraw is hostname and 192.168.40.197 is ip address

Verify your network settings
#ping -c 1 cdrraw

Step 4: disable secure linux by editing the "/etc/selinux/config" file
#vi /etc/selinux/config
SELINUX=permissive

Note: Reboot

Step 5: create group and user install oracle
#/usr/sbin/groupadd -g 501 oinstall
#/usr/sbin/groupadd -g 502 dba
#/usr/sbin/groupadd -g 503 oper
#/usr/sbin/useradd -u 502 -g oinstall -G dba,oper oracle
#passwd oracle

Step 6: create folder install oracle 
#mkdir -p /u01/app/oracle/product/11.2.0/db_1
#mkdir -p /u01/setup
#chown -R oracle:oinstall /u01
#chmod -R 775 /u01

Step 7: Set parameter
#vi /etc/sysctl.conf
add the following lines

kernel.shmmni = 4096 
kernel.shmmax = 4398046511104
kernel.shmall = 1073741824
kernel.sem = 250 32000 100 128

fs.aio-max-nr = 1048576
fs.file-max = 6815744
net.ipv4.ip_local_port_range = 9000 65500
net.core.rmem_default = 262144
net.core.rmem_max = 4194304
net.core.wmem_default = 262144
net.core.wmem_max = 1048586

#/sbin/sysctl -p

#vi /etc/security/limits.conf
add the following lines
oracle soft nofile 1024
oracle hard nofile 65536
oracle soft nproc 16384
oracle hard nproc 16384
oracle soft stack 10240
oracle hard stack 32768

#vi /etc/pam.d/login
session required pam_limits.so

Step 8: Install the following packages if they are not already present.

Check which packages are installed and which are missing
rpm -q --qf '%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n' binutils \
elfutils-libelf \
elfutils-libelf-devel \
gcc \
gcc-c++ \
glibc \
glibc-common \
glibc-devel \
glibc-headers \
ksh \
libaio \
libaio-devel \
libgcc \
libstdc++ \
libstdc++-devel \
make \
sysstat \
unixODBC \
unixODBC-devel

yum install binutils -y
yum install compat-libcap1 -y
yum install compat-libstdc++-33 -y
yum install compat-libstdc++-33.i686 -y
yum install gcc -y
yum install gcc-c++ -y
yum install glibc -y
yum install glibc.i686 -y
yum install glibc-devel -y
yum install glibc-devel.i686 -y
yum install ksh -y
yum install libgcc -y
yum install libgcc.i686 -y
yum install libstdc++ -y
yum install libstdc++.i686 -y
yum install libstdc++-devel -y
yum install libstdc++-devel.i686 -y
yum install libaio -y
yum install libaio.i686 -y
yum install libaio-devel -y
yum install libaio-devel.i686 -y
yum install libXext -y
yum install libXext.i686 -y
yum install libXtst -y
yum install libXtst.i686 -y
yum install libX11 -y
yum install libX11.i686 -y
yum install libXau -y
yum install libXau.i686 -y
yum install libxcb -y
yum install libxcb.i686 -y
yum install libXi -y
yum install libXi.i686 -y
yum install make -y
yum install sysstat -y
yum install unixODBC -y
yum install unixODBC-devel -y
now, i installed all packages 

Step 9: Set environmental variable for user ORACLE
#su - oracle
$ cd ~
$ vi .bash_profile
add the following lines
# Oracle Settings
TMP=/tmp; export TMP
TMPDIR=$TMP; export TMPDIR
export ORACLE_HOSTNAME=cdrraw
export ORACLE_UNQNAME=cdrraw
ORACLE_BASE=/u01/app/oracle; export ORACLE_BASE
ORACLE_HOME=$ORACLE_BASE/product/11.2.0/db_1; export ORACLE_HOME
ORACLE_SID=cdrraw; export ORACLE_SID
PATH=/usr/sbin:$PATH; export PATH
PATH=$ORACLE_HOME/bin:$PATH; export PATH
LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib; export LD_LIBRARY_PATH
CLASSPATH=$ORACLE_HOME/JRE:$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib; export CLASSPATH
if [ $USER = "oracle" ]; then
  if [ $SHELL = "/bin/ksh" ]; then
    ulimit -p 16384
    ulimit -n 65536
  else
    ulimit -u 16384 -n 65536
  fi
fi


Step 10: Upload files to server using user Oracle
/u01/setup/

Step 11: Unzip files
$unzip p10404530_112030_Linux-x86-64_1of7.zip
$unzip p10404530_112030_Linux-x86-64_2of7.zip

Step 12: Install oracle DB
$xhost +
$cd /u01/setup/database
$./runInstaller

To fix this error edit $ORACLE_HOME/sysman/lib/ins_emagent.mk, search for the line
$(MK_EMAGENT_NMECTL)
and replace the line with

$(MK_EMAGENT_NMECTL) -lnnz11
then click “Retry” button

Execute Configurtation Scripts
/u01/app/oraInventory/orainstRoot.sh
/u01/app/oracle/product/11.2.0/db_1/root.sh

Create listener and file tnsname 
$netca
$vi /u01/app/oracle/product/11.2.0/db_1/network/admin/tnsnames.ora
CDRRAW =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = cdrraw)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = SHARED)  // DEDICATED
      (SERVICE_NAME = cdrraw)
    )
  )

now, install ORACLE DATABSE using DBCA
$dbca
