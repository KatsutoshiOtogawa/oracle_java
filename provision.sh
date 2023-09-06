
yum -y update

# want to use pwmake. pwmake generate password following os security policy. 
yum install -y libpwquality

# yum -y install neovim tmux
yum -y install tmux
# for download sample shcmea.
yum -y install git

# jdk requirement for building jdk.
# yum -y install java-17-openjdk-devel
yum -y install java-11-openjdk-devel

yum -y install freetype-devel

yum -y install fontconfig-devel

yum -y install cups-devel

yum -y  install libXtst-devel libXt-devel libXrender-devel libXrandr-devel libXi-devel

yum -y install alsa-lib-devel
yum -y install libffi-devel
yum -y install autoconf

# documentに書かれていないが必要。
yum -y install unzip

# set up openjdk source code
# tag="jdk-18+37"
# oracle linux7がjdk11がデフォルトのため、バージョンを1あげる
# jdkのビルドに一つ前のバージョンのjdkが使われるため。
tag="jdk-12+32"
su - vagrant -c "mkdir -p \$HOME/src/openjdk"
su - vagrant -c "git clone https://github.com/openjdk/jdk.git \$HOME/src/openjdk/jdk"
su - vagrant -c "cd \$HOME/src/openjdk/jdk; git checkout ${tag}"

# install development tool for build.
yum -y groupinstall "Development Tools"

# install firewalld. firewalld is rhel,centos default dynamic firewall.
yum -y install firewalld

# enabla firewalld.
systemctl enable firewalld
systemctl start firewalld

# port forwarding oracle port 1521.
firewall-cmd --add-port=1521/tcp --zone=public --permanent

# reload firewall settings.
firewall-cmd --reload
