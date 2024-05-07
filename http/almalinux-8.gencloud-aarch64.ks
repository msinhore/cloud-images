# AlmaLinux 8 kickstart file for Generic Cloud (OpenStack) aarch64 image

url --url https://repo.almalinux.org/almalinux/8/BaseOS/aarch64/kickstart/
repo --name=BaseOS --baseurl=https://repo.almalinux.org/almalinux/8/BaseOS/aarch64/os/
repo --name=AppStream --baseurl=https://repo.almalinux.org/almalinux/8/AppStream/aarch64/os/

text
skipx
eula --agreed
firstboot --disabled

lang en_US.UTF-8
keyboard us
timezone UTC --isUtc

network --bootproto=dhcp
firewall --enabled --service=ssh
services --disabled="kdump" --enabled="chronyd,rsyslog,sshd"
selinux --enforcing

bootloader --timeout=0 --location=mbr --append="console=tty0 console=ttyS0,115200n8 no_timer_check net.ifnames=0"

zerombr
clearpart --all --initlabel
reqpart
part / --fstype="xfs" --size=8000

rootpw --plaintext almalinux

reboot --eject


%packages
@core
-biosdevname
-open-vm-tools
-plymouth
-dnf-plugin-spacewalk
-rhn*
-iprutils
-iwl*-firmware
%end


# disable kdump service
%addon com_redhat_kdump --disable
%end


%post
%end
