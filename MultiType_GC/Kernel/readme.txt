
��ġ ȯ��
  - Ubuntu 10.04, 64bit

���� ��ġ
  - /usr/src/pos.c
  - /usr/src/pos.h
  - /usr/src/move.sh
  - /usr/src/pos.diff
  - /root/library-pos.tar.bz2

---------------------------------------------------------------------------------------

1. ��ġ ����, Ŀ�� ������

  # su root
  # cd /usr/src
  # apt-get install build-essential bin86 kernel-package libncurses5-dev
  # wget -P /usr/src http://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.32.tar.bz2
  # tar xvfj linux-2.6.32.tar.bz2
  # patch -p0 < pos.diff
  # ./move.sh
  # ln -s /usr/src/linux-2.6.32 /usr/src/linux
  # cd /usr/src/linux
  # make menuconfig
  # make-kpkg clean
  # make-kpkg --initrd --revision=pos1 kernel_image kernel_headers modules_image
  # cd /usr/src
  # dpkg -i linux*pos1*.deb
  # cd /boot
  # mkinitramfs -o initrd.img-2.6.32 2.6.32
  # vi /etc/default/grub
    GRUB_DEFAULT=2 // Linux 2.6.32�� ����
  # update-grub
  # reboot

---------------------------------------------

update-grub ����� ���� ��

sh: getcwd() failed: No such file or directory
sh: getcwd() failed: No such file or directory
/usr/sbin/grub-probe: error: out of memory.

���� ���� �޼����� �� ��� �Ʒ��� ��ɾ ���� �� update-grub ����� �����ϸ� ��.

# cd /home/
# mkdir bugreprod
# cd bugreprod
# apt-get update

---------------------------------------------------------------------------------------

2. ���� ���̺귯�� ������

  # su root
  # cd /root
  # tar xvfj library-pos.tar.bz2
  # cd library-pos
  # ./install.sh
  # vi /etc/ld.so.conf
    /usr/local/lib/ �߰�
  # /sbin/ldconfig

---------------------------------------------

���̺귯���� ���� ��Ű������ ������ ��
-L /usr/local/lib -lpos �Ǵ� /usr/local/lib/libpos.so.0.0.0��
������ �ɼ����� ���Խ��Ѿ���.

---------------------------------------------------------------------------------------

3. �׽�Ʈ �ڵ� ����

  # su root
  # cd /root/library-pos
  # make
  # ./malloc-free create
  # ./malloc-free persistency
  # ./malloc-free persistency
	# ./malloc-free persistency
	# ./malloc-free persistency
	# ./malloc-free persistency

---------------------------------------------------------------------------------------




