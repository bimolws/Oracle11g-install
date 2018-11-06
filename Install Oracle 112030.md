#--- * * * Install oracle 11G R2 11.2.0.3 Centos 7* * * ---

1. Download Oracle 11g R2 11.2.0.3:

	cd /opt
	unzip p10404530_112030_Linux-x86-64_1of7.zip
	unzip p10404530_112030_Linux-x86-64_2of7.zip

2. Prepare:

-- Edit hosts file:

Hosts File

The "/etc/hosts" file must contain a fully qualified name for the server.

	<IP-address>  <fully-qualified-machine-name>  <machine-name>
For example.

	127.0.0.1       localhost.localdomain  localhost
	10.84.70.152  stag-app01

##Oracle Installation Prerequisites
###Automatic Setup
--  install all the necessary prerequisites automatically then edit  /etc/sysctl.conf và /etc/security/limit.conf
	yum install -y oracle-rdbms-server-11gR2-preinstall

###Manual Setup

	vi /etc/sysctl.conf
add :

	fs.suid_dumpable = 1
	fs.aio-max-nr = 1048576
	fs.file-max = 6815744
	kernel.shmall = 2097152
	kernel.shmmax = 536870912
	kernel.shmmni = 4096
	# semaphores: semmsl, semmns, semopm, semmni
	kernel.sem = 250 32000 100 128
	net.ipv4.ip_local_port_range = 9000 65500
	net.core.rmem_default=262144
	net.core.rmem_max=4194304
	net.core.wmem_default=262144
	net.core.wmem_max=1048586

Run :
	/sbin/sysctl -p

Add line to file "/etc/security/limits.conf":

	oracle              soft    nproc   16384
	oracle              hard    nproc   16384
	oracle              soft    nofile  4096
	oracle              hard    nofile  65536
	oracle              soft    stack   10240


	yum install -y binutils-2*x86_64*
	yum install -y glibc-2*x86_64* nss-softokn-freebl-3*x86_64*
	yum install -y compat-libstdc++-33*x86_64*
	yum install -y glibc-common-2*x86_64*
	yum install -y glibc-devel-2*x86_64*
	yum install -y glibc-headers-2*x86_64*
	yum install -y elfutils-libelf-0*x86_64*
	yum install -y elfutils-libelf-devel-0*x86_64*
	yum install -y gcc-4*x86_64*
	yum install -y gcc-c++-4*x86_64*
	yum install -y ksh-*x86_64*
	yum install -y libaio-0*x86_64*
	yum install -y libaio-devel-0*x86_64*
	yum install -y libgcc-4*x86_64*
	yum install -y libstdc++-4*x86_64*
	yum install -y libstdc++-devel-4*x86_64*
	yum install -y make-3.81*x86_64*
	yum install -y numactl-devel-2*x86_64*
	yum install -y sysstat-9*x86_64*
	yum install -y compat-libcap*

-- Add group and user:

	groupadd -g 501 oinstall
	groupadd -g 502 dba
	groupadd -g 503 oper
	groupadd -g 504 asmadmin
	groupadd -g 506 asmdba
	groupadd -g 505 asmoper

	useradd -u 502 -g oinstall -G dba,asmdba,oper oracle
Set password user oracle:
	passwd oracle

-- vi /etc/security/limits.d/90-nproc.conf:

	# Change from:
	*          soft    nproc    1024

	# To:
	* - nproc 16384

-- Set secure Linux to permissive by editing the "/etc/selinux/config" file, making sure the SELINUX flag is set as follows.

	SELINUX=permissive
---Disable firewall or iptable centos < 7

-- Create folder Oracle database:
	mkdir -p /u01/app/oracle/product/11.2.0/db_1
	chown -R oracle:oinstall /u01
	chmod -R 775 /u01

-- Add to file "/home/oracle/.bash_profile"
	# Oracle Settings
	TMP=/tmp; export TMP
	TMPDIR=$TMP; export TMPDIR

	ORACLE_HOSTNAME=stag-app01; export ORACLE_HOSTNAME
	ORACLE_UNQNAME=DB11G; export ORACLE_UNQNAME
	ORACLE_BASE=/u01/app/oracle; export ORACLE_BASE
	ORACLE_HOME=$ORACLE_BASE/product/11.2.0/db_1; export ORACLE_HOME
	ORACLE_SID=DB11G; export ORACLE_SID

	PATH=/usr/sbin:$PATH; export PATH
	PATH=$ORACLE_HOME/bin:$PATH; export PATH

	LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib; export LD_LIBRARY_PATH
	CLASSPATH=$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib; export CLASSPATH

-- Install Display:
 ++ Allow X11 forwarding:
 	vi /etc/ssh/sshd_config 
 	Change from:
		#AddressFamily any
 	Replace comment and change to:
		AddressFamily inet
	Replace comment: #X11Forwarding no
 	Change to:  X11Forwarding yes
 	restart sshd:   /etc/init.d/sshd restart
 ++ On work_station 
    Open putty >> ssh >> X11 >> check box "Enable X11 forwarding", Input display location: IP_work_station:10.0
    Config Xming ( install and setup): check "Display number" 10, anh tick "No Access control"
 ++ On server install Oracle db:
	yum install -y xorg-x11-app*
	yum install -y xorg-x11-server-utils

	export DISPLAY=:0.0
 	xhost +


3. Install:

-- unzip file:

	#11.2.0.3
	cd /opt
	unzip p10404530_112030_Linux-x86-64_1of7.zip
	unzip p10404530_112030_Linux-x86-64_2of7.zip

Extract to folder database:	
	chown -R oracle:oinstall /opt/database
	su - oracle
	cd /opt/database
	./runInstaller


4. Post Installation

Edit the "/etc/oratab" file setting the restart flag for each instance to 'Y'.

	DB11G:/u01/app/oracle/product/11.2.0/db_1:Y

__Reference__: https://oracle-base.com/articles/11g/oracle-db-11gr2-installation-on-oracle-linux-6


**Fix Error**: DB : pdksh-5.2.14 missing while installing 11g in RHEL-6.5 (64-bit)

1. Change directory to <path>/database/stage/cvu/cv/admin
2. Backup cvu_config
$ cp cvu_config backup_cvu_config
3. Edit cvu_config and change the following line:
from:
CV_ASSUME_DISTID=OEL4
to:
CV_ASSUME_DISTID=OEL6
4. Save the updated cvu_config file
5. Install the 11.2.0.3 or 11.2.0.4 software using <path>/database/runInstaller
    $ cd <path>/database
    $ ./runInstaller

**“INS-35075**: The specified SID is already in use” error in Oracle, how to fix it?

	Delete 
	/etc/oratab
	
**How to increase swap size?**

	Let's say you need another 500M:
	dd if=/dev/zero of=/tmp/swapfile bs=1M count=500
	mkswap /tmp/swapfile
	swapon /tmp/swapfile
	After you're done installing, you can turn it off.
	swapoff /tmp/swapfile
	rm /tmp/swapfile

From <https://community.oracle.com/thread/2189824> 













