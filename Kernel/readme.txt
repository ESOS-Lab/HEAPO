
설치 환경
  - Ubuntu 10.04, 64bit

파일 위치
  - /usr/src/pos.c
  - /usr/src/pos.h
  - /usr/src/move.sh
  - /usr/src/pos.diff
  - /root/library-pos.tar.bz2

---------------------------------------------------------------------------------------

1. 패치 적용, 커널 컴파일

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
    GRUB_DEFAULT=2 // Linux 2.6.32로 지정
  # update-grub
  # reboot

---------------------------------------------

update-grub 명령을 실행 시

sh: getcwd() failed: No such file or directory
sh: getcwd() failed: No such file or directory
/usr/sbin/grub-probe: error: out of memory.

위와 같은 메세지가 뜰 경우 아래의 명령어를 실행 뒤 update-grub 명령을 실행하면 됨.

# cd /home/
# mkdir bugreprod
# cd bugreprod
# apt-get update

---------------------------------------------------------------------------------------

2. 공유 라이브러리 컴파일

  # su root
  # cd /root
  # tar xvfj library-pos.tar.bz2
  # cd library-pos
  # ./install.sh
  # vi /etc/ld.so.conf
    /usr/local/lib/ 추가
  # /sbin/ldconfig

---------------------------------------------

라이브러리를 포함 시키기위해 컴파일 시
-L /usr/local/lib -lpos 또는 /usr/local/lib/libpos.so.0.0.0를
컴파일 옵션으로 포함시켜야함.

---------------------------------------------------------------------------------------

3. 테스트 코드 실행

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




