#!/bin/bash

headers='http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10.17/linux-headers-4.10.17-041017_4.10.17-041017.201705201051_all.deb'
generic='http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10.17/linux-headers-4.10.17-041017-generic_4.10.17-041017.201705201051_amd64.deb'
image='http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10.17/linux-image-4.10.17-041017-generic_4.10.17-041017.201705201051_amd64.deb'

for i in headers generic image; do
	wget $(eval echo \$$i)
	dpkg -i linux*.deb
done 

echo "tcp_bbr" >> /etc/modules-load.d/modules.conf

echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf

rm -rf linux*.deb*
